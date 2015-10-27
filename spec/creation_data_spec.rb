require 'spec_helper'

describe Sigiss::CreationData do

  before(:each) do
    @params = invoice_data_params
    @invoice_data = Sigiss::CreationData.new(@params)
  end

  it '#to_hash' do
    expect(@invoice_data.to_hash).to eq(invoice_data_params)
  end

  context '#initialize' do

    it 'has attributes' do
      expect(@invoice_data).to have_attributes(@params)
    end

    it 'is not valid if missing servico' do
      @invoice_data.servico = nil
      expect(@invoice_data.valid?).to be_falsy
    end

    it 'is not valid if missing situacao' do
      @invoice_data.situacao = nil
      expect(@invoice_data.valid?).to be_falsy
    end

    it 'is not valid if missing valor' do
      @invoice_data.valor = nil
      expect(@invoice_data.valid?).to be_falsy
    end

    it 'is not valid if missing base' do
      @invoice_data.base = nil
      expect(@invoice_data.valid?).to be_falsy
    end
  end

end
