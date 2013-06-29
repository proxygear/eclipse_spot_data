module EclipseSpot
  class Data
    ALL_PATH = "**", "*.yml"
    BASE_OPTIONS = {lang: '*', type: '*', book: '**'}
    REGEXP = /(?<book>[a-z_]*)\/(?<type>[a-z_]*)\.(?<lang>[a-z]{2})\.yml$/

    attr_reader :books, :langs, :types

    def initialize
      rescan
    end

    def exist? options
      match = true
      options.each do |t, s|
        match = collections[t].include?(s.to_s)
        break unless match
      end
      match
    end

    def load! book, type, lang
      options = {book: book, type: type, lang: lang}
      unless exist?(options)
        raise EclipseSpot::Data::YamlException.new "#{options} does not exist"
      end
      path = data_path(options_to_path({
        book: book,
        lang: lang,
        type: type
      }))
      yml = YAML::load File.open(path)
      yml[lang.to_s][type.to_s]
    end

    def rescan
      self.books = []
      self.langs = []
      self.types = []
      Dir.glob(data_path ALL_PATH) do |item_path|
        matching = REGEXP.match item_path
        unless matching
          puts "/!\ ignored data file #{item_path}"
        else
          collections.each do |t, a|
            v = matching[t]
            a.push v unless a.include?(v)
          end
        end
      end
    end

    def collections
      {
        book: self.books,
        lang: self.langs,
        type: self.types
      }
    end

    def options_to_path opt
      opt = default_options(opt)
      [opt[:book].to_s, "#{opt[:type]}.#{opt[:lang]}.yml"]
    end

    def default_options opt={}
      BASE_OPTIONS.merge opt
    end

    def data_path *path
      full_path = File.join(File.dirname(__FILE__), '..', '..', 'data', *path)
      File.expand_path full_path
    end
    
    protected
    attr_writer :books, :langs, :types
  end
end