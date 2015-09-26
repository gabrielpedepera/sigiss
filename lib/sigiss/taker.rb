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

    def initialize(params = {})
      @tomador_tipo = params[:tomador_tipo]
      @tomador_cnpj = params[:tomador_cnpj]
      @tomador_email = params[:tomador_email]
      @tomador_im = params[:tomador_im]
      @tomador_ie = params[:tomador_ie]
      @tomador_razao = params[:tomador_razao]
      @tomador_fantasia = params[:tomador_fantasia]
      @tomador_endereco = params[:tomador_endereco]
      @tomador_numero = params[:tomador_numero]
      @tomador_complemento = params[:tomador_complemento]
      @tomador_bairro = params[:tomador_bairro]
      @tomador_CEP = params[:tomador_CEP]
      @tomador_cod_cidade = params[:tomador_cod_cidade] || Sigiss::IBGE.get_code(params[:cidade])
      @tomador_fone = params[:tomador_fone]
      @tomador_ramal = params[:tomador_ramal]
      @tomador_fax = params[:tomador_fax]
      @tomador_ramal_fax = params[:tomador_ramal_fax]
    end

  end
end

