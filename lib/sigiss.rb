require "sigiss/version"
require "sigiss/ibge"
require "sigiss/gateway"
require "sigiss/provider"
require "sigiss/taker"

module Sigiss

  def self.root
    File.dirname __dir__
  end

end
