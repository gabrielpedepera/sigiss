require 'spec_helper'

describe Sigiss::Provider do
  context 'initialize' do

    before(:each) do
      @params = {
        ccm: '123',
        cnpj: '',
        senha: 'password',
        crc: '456',
        crc_estado: 'SP'
      }
      @gateway = Sigiss::Provider.new(@params)
    end

    it 'has attributes: ccm, cnpj, senha, crc, crc_estado' do
      expect(@gateway).to have_attributes(@params)
    end

  end

end
