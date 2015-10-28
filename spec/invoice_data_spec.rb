require 'spec_helper'

describe Sigiss::InvoiceData do

  context 'creation_data' do
    before(:each) do
      @params = creation_data
      @invoice_data = Sigiss::CreationData.new(@params)
    end

    it '#to_hash' do
      expect(@invoice_data.to_hash).to eq(creation_data)
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

    context 'fetch_data' do
      before(:each) do
        @params = fetch_data
        @invoice_data = Sigiss::FetchData.new(@params)
      end

      it '#to_hash' do
        expect(@invoice_data.to_hash).to eq(fetch_data)
      end

      context '#initialize' do

        it 'has attributes' do
          expect(@invoice_data).to have_attributes(@params)
        end

        it 'is not valid if missing nota' do
          @invoice_data.nota = nil
          expect(@invoice_data.valid?).to be_falsy
        end

        it 'is not valid if missing serie' do
          @invoice_data.serie = nil
          expect(@invoice_data.valid?).to be_falsy
        end

        it 'is not valid if missing autenticidade' do
          @invoice_data.autenticidade = nil
          expect(@invoice_data.valid?).to be_falsy
        end

        it 'is not valid if missing valor' do
          @invoice_data.valor = nil
          expect(@invoice_data.valid?).to be_falsy
        end
      end
    end


  end
end
