module Sigiss
  class FetchData < InvoiceData

    attr_accessor :nota, :serie, :autenticidade, :valor
    validates_presence_of :nota, :serie, :autenticidade, :valor

    def initialize(attributes = {})
      @nota = attributes[:nota]
      @serie = attributes[:serie]
      @autenticidade = attributes[:autenticidade]
      @valor = attributes[:valor]
    end

  end
end
