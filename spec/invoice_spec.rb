require 'spec_helper'

describe Sigiss::Invoice do

  context 'initialize' do

    before(:each) do
      gateway = Sigiss::Gateway.new(:marilia, :test)
      provider = Sigiss::Provider.new(provider_params)
      taker = Sigiss::Taker.new(taker_params)
      @params = { gateway: gateway, provider: provider, taker: taker}
      @invoice = Sigiss::Invoice.new(@params)
    end

    it 'has attributes' do
      expect(@invoice).to have_attributes(@params)
    end

  end

end
