require "sigiss/version"
require "sigiss/gateway"
require "sigiss/provider"
require "sigiss/taker"

module Sigiss

  def self.root
    File.dirname __dir__
  end

end
