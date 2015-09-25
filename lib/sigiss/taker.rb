module Sigiss
  class Taker
    attr_accessor :tomador_tipo,
                  :cnpj_tomador,
                  :email_do_tomador,
                  :inscricao_municipal_tomador,
                  :inscricao_estadual_tomador,
                  :nome_razão_do_tomador,
                  :nome_fantasia_do_tomador,
                  :endereço_do_tomador,
                  :numero_do_endereco_do_tomador,
                  :complemento_do_endereco_do_tomador,
                  :bairro_do_tomador,
                  :cep_do_tomador,
                  :codigo_da_cidade_do_tomador,
                  :telefone_do_tomador,
                  :ramal_tomador,
                  :fax_tomador,
                  :ramal_fax_tomador

    def initialize(params = {})
      @tomador_tipo = params[:tomador_tipo]
      @cnpj_tomador = params[:cnpj_tomador]
      @email_do_tomador = params[:email_do_tomador]
      @inscricao_municipal_tomador = params[:inscricao_municipal_tomador]
      @inscricao_estadual_tomador = params[:inscricao_estadual_tomador]
      @nome_razão_do_tomador = params[:nome_razão_do_tomador]
      @nome_fantasia_do_tomador = params[:nome_fantasia_do_tomador]
      @endereço_do_tomador = params[:endereço_do_tomador]
      @numero_do_endereco_do_tomador = params[:numero_do_endereco_do_tomador]
      @complemento_do_endereco_do_tomador = params[:complemento_do_endereco_do_tomador]
      @bairro_do_tomador = params[:bairro_do_tomador]
      @cep_do_tomador = params[:cep_do_tomador]
      @codigo_da_cidade_do_tomador = params[:codigo_da_cidade_do_tomador] || Sigiss::IBGE.get_code(params[:cidade])
      @telefone_do_tomador = params[:telefone_do_tomador]
      @ramal_tomador = params[:ramal_tomador]
      @fax_tomador = params[:fax_tomador]
      @ramal_fax_tomador = params[:ramal_fax_tomador]
    end

  end
end

