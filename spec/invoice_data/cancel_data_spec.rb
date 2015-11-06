require 'spec_helper'

describe Sigiss::CancelData do

  context 'cancel_data' do
    before(:each) do
      @params = cancel_data
      @invoice_data = Sigiss::CancelData.new(@params)
    end

    it '#to_hash' do
      expect(@invoice_data.to_hash).to eq(cancel_data)
    end

    context '#initialize' do

      it 'has attributes' do
        expect(@invoice_data).to have_attributes(@params)
      end

      it 'is not valid if missing nota' do
        @invoice_data.nota = nil
        expect(@invoice_data.valid?).to be_falsy
      end

      it 'is not valid if missing motivo' do
        @invoice_data.motivo = nil
        expect(@invoice_data.valid?).to be_falsy
      end

      it 'is valid if missing email' do
        @invoice_data.email = nil
        expect(@invoice_data.valid?).to be_truthy
      end
    end
  end

end
