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
        @invoice.build(:issue, creation_data)
      end

      it 'has params hash DescricaoRps' do
        expect(@invoice.data_issue).to eq(issue_request)
      end

      it 'has response success' do
        response = @invoice.issue!
        expect(response).to have_key(:success)
      end

      it 'has response body' do
        response = @invoice.issue!
        expect(response).to have_key(:body)
      end
    end

    context '#fetch!' do
      before(:each) do
        @invoice.build(:fetch, fetch_data)
      end

      it 'has params hash DadosConsultaNota' do
        expect(@invoice.data_fetch).to eq(fetch_request)
      end

      it 'has response success' do
        response = @invoice.fetch!
        expect(response).to have_key(:success)
      end

      it 'has response body' do
        response = @invoice.fetch!
        expect(response).to have_key(:body)
      end
    end

  end

end
