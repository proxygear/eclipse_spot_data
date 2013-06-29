describe EclipseSpot::Data do
  subject(:data) { described_class.new }
  describe 'dynamic collections' do
    [
      :books,
      :langs,
      :types
    ].each do |collection|
      its(collection) { should be_kind_of(Array) }
    end
  end
end