require "sigiss/version"
require "sigiss/ibge"
require "sigiss/gateway"
require "sigiss/provider"
require "sigiss/taker"
require "sigiss/invoice"
require "sigiss/invoice_data/invoice_data"
require "sigiss/invoice_data/invoice_data_create"
require "sigiss/integration"

module Sigiss

  def self.root
    File.dirname __dir__
  end

end
