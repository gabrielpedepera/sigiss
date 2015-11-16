module Sigiss
  class IssueData < InvoiceData

    attr_accessor :aliquota_simples,
                  :id_sis_legado,
                  :servico,
                  :situacao,
                  :valor,
                  :base,
                  :descricaoNF

    validates_presence_of :servico, :situacao, :valor, :base

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
