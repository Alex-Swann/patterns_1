require 'converter'

describe Converter do
  subject(:converter) { described_class.new(string,location) }
  let(:string) { "EXAMPLE STRING" }
  let(:location) { "SUFFOLK" }

  describe '.convert' do
    it 'converts a string into text' do
      expect(converter.convert(:text)).to eq "EXAMPLE STRING *******"
    end
    it 'converts a string into html' do
      expect(converter.convert(:html)).to eq "<html><head></head><body>EXAMPLE STRING *******</body></html>"
    end
    it 'converts a string into json' do
      expect(converter.convert(:json)).to eq "{\"response\":\"EXAMPLE STRING *******\"}"
    end
    it 'converts a string into xml' do
      expect(converter.convert(:xml)).to eq "<response>EXAMPLE STRING *******</response>"
    end


    it 'raises an error given an unrecognised type' do
      expect { converter.convert(:garbage) }.to raise_error "Unrecognised type"
    end
  end
end