require 'spec_helper'

describe Sigiss::Taker do

  before(:each) do
    @params = taker_params
    @taker = Sigiss::Taker.new(@params)
  end

  it '#to_hash' do
    expect(@taker.to_hash).to eq(taker_params)
  end

  context 'validations' do

    it 'has attributes' do
      expect(@taker).to have_attributes(@params)
    end

    it 'is not valid if missing tomador_tipo' do
      @taker.tomador_tipo = nil
      expect(@taker.valid?).to be_falsy
    end

    it 'is not valid if missing tomador_cnpj' do
      @taker.tomador_cnpj = nil
      expect(@taker.valid?).to be_falsy
    end

    it 'is not valid if missing tomador_razao' do
      @taker.tomador_razao = nil
      expect(@taker.valid?).to be_falsy
    end

    it 'is not valid if missing tomador_endereco' do
      @taker.tomador_endereco = nil
      expect(@taker.valid?).to be_falsy
    end

    it 'is not valid if missing tomador_numero' do
      @taker.tomador_numero = nil
      expect(@taker.valid?).to be_falsy
    end

    it 'is not valid if missing tomador_bairro' do
      @taker.tomador_bairro = nil
      expect(@taker.valid?).to be_falsy
    end

    it 'is not valid if missing tomador_CEP' do
      @taker.tomador_CEP = nil
      expect(@taker.valid?).to be_falsy
    end

    it 'is not valid if missing tomador_cod_cidade' do
      @taker.tomador_cod_cidade = nil
      expect(@taker.valid?).to be_falsy
    end

  end

  context 'recover code city' do

    it 'passing code city' do
      expect(Sigiss::Taker.new(tomador_cod_cidade: '3127107').tomador_cod_cidade).to eq('3127107')
    end

    it 'passing name city' do
      expect(Sigiss::Taker.new(cidade: 'Assis').tomador_cod_cidade).to eq('3504008')
    end

    it 'passing name and code city, code preferences' do
      expect(Sigiss::Taker.new(cidade: 'Marília', tomador_cod_cidade: '3127107').tomador_cod_cidade).to eq('3127107')
    end

  end

end
