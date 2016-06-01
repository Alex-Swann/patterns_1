require 'converter'

describe Converter do
  subject(:converter) { described_class.new(string, location) }
  let(:string) { "EXAMPLE STRING" }
  let(:location) { "SUFFOLK" }

  describe '.convert' do
    it 'converts a string given a type' do
      expect(converter.convert(:text)).to eq "EXAMPLE STRING SUFFOLK"
      expect(converter.convert(:html)).to eq "<html><head></head><body>EXAMPLE STRING SUFFOLK</body></html>"
      expect(converter.convert(:json)).to eq "{\"response\":\"EXAMPLE STRING SUFFOLK\"}"
      expect(converter.convert(:xml)).to eq "<response>EXAMPLE STRING SUFFOLK</response>"
    end

    it 'raises an error given an unrecognised type' do
      expect { converter.convert(:garbage) }.to raise_error "Unrecognised type"
    end
  end
end