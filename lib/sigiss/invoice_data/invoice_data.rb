require 'active_model'
require 'sigiss/extension'
module Sigiss
  class InvoiceData
    include ActiveModel::Validations
    include Sigiss::Extension

  end
end
