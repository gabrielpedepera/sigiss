require 'sigiss/integration'
require 'active_model'
module Sigiss
  class Invoice
    include ActiveModel::Validations
    include Sigiss::Integration

    attr_accessor :gateway, :provider, :taker, :data, :success, :response

    validates_presence_of :gateway, :provider, :taker, :data, :success, :response

    def initialize(attributes = {})
      @gateway = attributes[:gateway]
      @provider = attributes[:provider]
      @taker = attributes[:taker]
      @success = false
      @response = {}
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

    def success?
      @success
    end

  end
end
