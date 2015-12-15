require 'spec_helper'

describe Sigiss::Invoice do

  before(:each) do
    gateway = Sigiss::Gateway.new(:marilia, :test)
    provider = Sigiss::Provider.new(provider_params)
    taker = Sigiss::Taker.new(taker_params)
    @params = { gateway: gateway, provider: provider, taker: taker}
    @invoice = Sigiss::Invoice.new(@params)
  end

  context '#initialize' do
    it 'has attributes' do
      expect(@invoice).to have_attributes(@params)
    end
  end

  context '#build' do
    context '#issue!' do
      before(:each) do
        @invoice.build(:issue, issue_data)
      end

      it 'has params hash DescricaoRps' do
        expect(@invoice.data_issue).to eq(issue_request)
      end

      it 'has success' do
        VCR.use_cassette('issue') do
          @invoice.issue!
          expect(@invoice.success).to be_truthy
        end
      end

      it 'has response' do
        VCR.use_cassette('issue') do
          @invoice.issue!
          expect(@invoice.response).to_not be_empty
        end
      end
    end

    context '#fetch!' do
      before(:each) do
        @invoice.build(:fetch, fetch_data)
      end

      it 'has params hash DadosConsultaNota' do
        expect(@invoice.data_fetch).to eq(fetch_request)
      end

      it 'has success' do
        VCR.use_cassette('fetch') do
          @invoice.fetch!
          expect(@invoice.success).to be_truthy
        end
      end

      it 'has response' do
        VCR.use_cassette('fetch') do
          @invoice.fetch!
          expect(@invoice.response).to_not be_empty
        end
      end
    end

    context '#cancel!' do
      before(:each) do
        @invoice.build(:cancel, cancel_data)
      end

      it 'has params hash DadosCancelaNota' do
        expect(@invoice.data_cancel).to eq(cancel_request)
      end

      it 'has success' do
        VCR.use_cassette('cancel') do
          @invoice.cancel!
          expect(@invoice.success).to be_truthy
        end
      end

      it 'has response' do
        VCR.use_cassette('cancel') do
          @invoice.cancel!
          expect(@invoice.response).to_not be_empty
        end
      end
    end

  end

end
