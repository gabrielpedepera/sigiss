require 'spec_helper'

describe Sigiss::Gateway do

  context 'valid' do
    before(:each) do
      @gateway = Sigiss::Gateway.new(:marilia, :test)
    end

    it 'has a name' do
      expect(@gateway.name).to eq(:marilia)
    end

    it 'has a environment' do
      expect(@gateway.environment).to eq(:test)
    end

    it 'has a URL to integration' do
      expect(@gateway.url).to eq('https://testemarilia.sigiss.com.br/testemarilia/ws/sigiss_ws.php?wsdl')
    end
  end

  context 'invalid', :focus do

    it 'without parameters' do
      gateway = Sigiss::Gateway.new
      gateway.valid?

      expect(gateway.errors).to include(:name, :url)
    end

    it 'gateway (city) not found' do
      gateway = Sigiss::Gateway.new(:manaus, :test)
      gateway.valid?

      expect(gateway.errors).to include(:name, :url)
    end

  end
end
