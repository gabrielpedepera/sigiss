module Sigiss
  class InvoiceDataCreate < InvoiceData

    attr_accessor :aliquota_simples,
                  :id_sis_legado,
                  :servico,
                  :situacao,
                  :valor,
                  :base,
                  :descricaoNF

    validates :servico, presence: true
    validates :situacao, presence: true
    validates :valor, presence: true
    validates :base, presence: true

    def initialize(attributes = {})
      @aliquota_simples = attributes[:aliquota_simples]
      @id_sis_legado = attributes[:id_sis_legado]
      @servico = attributes[:servico]
      @situacao = attributes[:situacao]
      @valor = attributes[:valor]
      @base = attributes[:base]
      @descricaoNF = attributes[:descricaoNF]
    end

  end
end
