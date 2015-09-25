require 'spec_helper'

describe Sigiss::Taker do
  context 'initialize' do

    before(:each) do
      @params = {
        tomador_tipo: '1',
        cnpj_tomador: '20.796.048/0001-65',
        email_do_tomador: 'email@tomador.com',
        inscricao_municipal_tomador: '',
        inscricao_estadual_tomador: '',
        nome_razão_do_tomador: 'ACME',
        nome_fantasia_do_tomador: 'ACME',
        endereço_do_tomador: 'Rua de Asfalto',
        numero_do_endereco_do_tomador: '100',
        complemento_do_endereco_do_tomador: 'Fundos',
        bairro_do_tomador: 'Bairro Feliz',
        cep_do_tomador: '111.331.155-00',
        codigo_da_cidade_do_tomador: '3127107',
        telefone_do_tomador: '3499998888',
        ramal_tomador: '21',
        fax_tomador: '',
        ramal_fax_tomador: ''
      }
      @taker = Sigiss::Taker.new(@params)
    end

    it 'has attributes' do
      expect(@taker).to have_attributes(@params)
    end

  end

  context 'recover code city' do

    it 'passing code city' do
      expect(Sigiss::Taker.new(codigo_da_cidade_do_tomador: '3127107').codigo_da_cidade_do_tomador).to eq('3127107')
    end

    it 'passing name city' do
      expect(Sigiss::Taker.new(cidade: 'Assis').codigo_da_cidade_do_tomador).to eq('3504008')
    end

    it 'passing name and code city, code preferences' do
      expect(Sigiss::Taker.new(cidade: 'Marília', codigo_da_cidade_do_tomador: '3127107').codigo_da_cidade_do_tomador).to eq('3127107')
    end

  end

end
