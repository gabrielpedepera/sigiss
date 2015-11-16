require 'sigiss/integration'
require 'active_model'
module Sigiss
  class Invoice
    include ActiveModel::Validations
    include Sigiss::Integration

    attr_accessor :gateway, :provider, :taker, :data

    validates_presence_of :gateway, :provider, :taker, :data

    def initialize(attributes = {})
      @gateway = attributes[:gateway]
      @provider = attributes[:provider]
      @taker = attributes[:taker]
    end

    def build(method, params = {})
      case method
      when :issue
        @data = Sigiss::IssueData.new(params)
      when :fetch
        @data = Sigiss::FetchData.new(params)
      when :cancel
        @data = Sigiss::CancelData.new(params)
      else
        @data = {}
      end
    end

  end
end
