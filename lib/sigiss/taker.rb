require 'lotus/validations'
module Sigiss
  class Taker
    include Lotus::Validations

    attr_accessor :tomador_tipo,
                  :tomador_cnpj,
                  :tomador_email,
                  :tomador_im,
                  :tomador_ie,
                  :tomador_razao,
                  :tomador_fantasia,
                  :tomador_endereco,
                  :tomador_numero,
                  :tomador_complemento,
                  :tomador_bairro,
                  :tomador_CEP,
                  :tomador_cod_cidade,
                  :tomador_fone,
                  :tomador_ramal,
                  :tomador_fax,
                  :tomador_ramal_fax

    validates :tomador_tipo, presence: true
    validates :tomador_cnpj, presence: true
    validates :tomador_razao, presence: true
    validates :tomador_endereco, presence: true
    validates :tomador_numero, presence: true
    validates :tomador_bairro, presence: true
    validates :tomador_CEP, presence: true
    validates :tomador_cod_cidade, presence: true

    def initialize(attributes = {})
      @tomador_tipo = attributes[:tomador_tipo]
      @tomador_cnpj = attributes[:tomador_cnpj]
      @tomador_email = attributes[:tomador_email]
      @tomador_im = attributes[:tomador_im]
      @tomador_ie = attributes[:tomador_ie]
      @tomador_razao = attributes[:tomador_razao]
      @tomador_fantasia = attributes[:tomador_fantasia]
      @tomador_endereco = attributes[:tomador_endereco]
      @tomador_numero = attributes[:tomador_numero]
      @tomador_complemento = attributes[:tomador_complemento]
      @tomador_bairro = attributes[:tomador_bairro]
      @tomador_CEP = attributes[:tomador_CEP]
      @tomador_cod_cidade = attributes[:tomador_cod_cidade] || Sigiss::IBGE.get_code(attributes[:cidade])
      @tomador_fone = attributes[:tomador_fone]
      @tomador_ramal = attributes[:tomador_ramal]
      @tomador_fax = attributes[:tomador_fax]
      @tomador_ramal_fax = attributes[:tomador_ramal_fax]
    end

  end
end

