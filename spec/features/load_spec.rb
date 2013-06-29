describe EclipseSpot::Data do
  subject(:data) { described_class.new }
  describe '#load!' do
    describe 'core backgrounds en' do
      let(:core_backgrounds_en) do
        [:core, :backgrounds, :en]
      end
      it { data.load!(*core_backgrounds_en).should be_kind_of(Hash) }
    end

    describe 'core backgrounds xt' do
      let(:core_backgrounds_xt) do
        [:core, :backgrounds, :xt]
      end
      it('raise an exception') do
        call_xt_lang = lambda { data.load! *core_backgrounds_xt }
        call_xt_lang.should raise_exception(EclipseSpot::Data::YamlException)
      end
    end
  end
end