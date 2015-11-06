module Sigiss
  class CancelData < InvoiceData

    attr_accessor :nota,
                  :motivo,
                  :email

    validates :nota, presence: true
    validates :motivo, presence: true

    def initialize(attributes = {})
      @nota = attributes[:nota]
      @motivo = attributes[:motivo]
      @email = attributes[:email]
    end

  end
end
