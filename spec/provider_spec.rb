require 'spec_helper'

describe Sigiss::Provider do

  before(:each) do
    @params = {
      ccm: '123',
      cnpj: '20.796.048/0001-65',
      senha: 'password',
      crc: '456',
      crc_estado: 'SP'
    }
    @provider = Sigiss::Provider.new(@params)
  end

  context 'validations' do

    it 'valid?' do
      expect(@provider.valid?).to be_truthy
    end

    it 'has attributes: ccm, cnpj, senha, crc, crc_estado' do
      expect(@provider).to have_attributes(@params)
    end

    it 'is not valid if missing cnpj' do
      @provider.cnpj = nil
      expect(@provider.valid?).to be_falsy
    end

    it 'is not valid if missing ccm' do
      @provider.ccm = nil
      expect(@provider.valid?).to be_falsy
    end

    it 'is not valid if missing senha' do
      @provider.senha = nil
      expect(@provider.valid?).to be_falsy
    end
  end

end
