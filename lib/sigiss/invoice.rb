require 'lotus/validations'
module Sigiss
  class Invoice
    include Lotus::Validations

    attr_accessor :gateway, :provider, :taker

    validates :gateway, type: Gateway, presence: true
    validates :provider, type: Provider, presence: true
    validates :taker, type: Taker, presence: true

    def initialize(params = {})
      @gateway = params[:gateway]
      @provider = params[:provider]
      @taker = params[:taker]
    end

  end
end
