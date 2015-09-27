require 'lotus/validations'
require 'sigiss/extension'
module Sigiss
  class InvoiceData
    include Lotus::Validations
    include Sigiss::Extension

  end
end
