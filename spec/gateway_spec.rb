require 'spec_helper'

describe Sigiss::Gateway do
  context 'initialize' do

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

end
