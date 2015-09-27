require 'spec_helper'

describe Sigiss::InvoiceDataCreate do

  context '#initialize' do

    before(:each) do
      @params = invoice_data_params
      @invoice_data = Sigiss::InvoiceDataCreate.new(@params)
    end

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
