module Sigiss
  class CancelData < InvoiceData

    attr_accessor :nota, :motivo, :email

    validates_presence_of :nota, :motivo

    def initialize(attributes = {})
      @nota = attributes[:nota]
      @motivo = attributes[:motivo]
      @email = attributes[:email]
    end

  end
end
