require 'lotus/validations'
require 'sigiss/integration'

module Sigiss
  class Invoice
    include Lotus::Validations
    include Sigiss::Integration

    attr_accessor :gateway,
                  :provider,
                  :taker,
                  :data

    validates :gateway, type: Gateway, presence: true
    validates :provider, type: Provider, presence: true
    validates :taker, type: Taker
    validates :data, presence: true

    def initialize(attributes = {})
      @gateway = attributes[:gateway]
      @provider = attributes[:provider]
      @taker = attributes[:taker]
    end

    def create(params = {})
      @data = Sigiss::InvoiceDataCreate.new(params)
    end

  end
end
