module Sigiss
  class FetchData < InvoiceData

    attr_accessor :nota,
                  :serie,
                  :autenticidade,
                  :valor

    validates :nota, presence: true
    validates :serie, presence: true
    validates :autenticidade, presence: true
    validates :valor, presence: true

    def initialize(attributes = {})
      @nota = attributes[:nota]
      @serie = attributes[:serie]
      @autenticidade = attributes[:autenticidade]
      @valor = attributes[:valor]
    end

  end
end
