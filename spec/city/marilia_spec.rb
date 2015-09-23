require 'spec_helper'

describe Sigiss::City::Marilia do
  it 'has a attribute url to test' do
    expect(Sigiss::City::Marilia.new(:test).url).to eq('https://testemarilia.sigiss.com.br/testemarilia/ws/sigiss_ws.php?wsdl')
  end

  it 'has a attribute url to production' do
    expect(Sigiss::City::Marilia.new(:production).url).to eq('https://marilia.sigiss.com.br/marilia/ws/sigiss_ws.php?wsdl')
  end
end
