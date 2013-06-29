describe EclipseSpot::Data do
  describe 'exist?' do
    subject(:data) { described_class.new }

    it 'does not accept empty options' do
      call_without_opt = lambda { data.exist? {} }
      call_without_opt.should raise_exception
    end

    context 'unit options' do
      {book: :core, type: :backgrounds, lang: :en}.each do |k,v|
        describe "#{k} => #{v}" do
          it('returns true') { data.exist?(k => v).should == true }
        end
      end

      {book: :fubar_book, type: :fubar_types, lang: :fu}.each do |k,v|
        describe "#{k} => #{v}" do
          it('returns false') { data.exist?(k => v).should == false }
        end
      end
    end

    context 'with grouped options' do
      describe 'core backgrounds en' do
        let(:core_backgrounds_en) do
          {book: :core, type: :backgrounds, lang: :en}
        end
        it { data.exist?(core_backgrounds_en).should == true }
      end
      describe 'core backgrounds xt' do
        let(:core_backgrounds_xt) do
          {book: :core, type: :backgrounds, lang: :xt}
        end
        it { data.exist?(core_backgrounds_xt).should == false }
      end
    end
  end
end