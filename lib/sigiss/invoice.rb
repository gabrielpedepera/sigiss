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

    def build(method, params = {})
      case method
      when :issue
        @data = Sigiss::CreationData.new(params)
      when :fetch
        @data = Sigiss::FetchData.new(params)
      else
        @data = {}
      end
    end

  end
end
