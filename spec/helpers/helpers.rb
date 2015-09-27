module Helpers

  def taker_params
    {
      tomador_tipo: '1',
      tomador_cnpj: '20.796.048/0001-65',
      tomador_email: 'email@tomador.com',
      tomador_im: '',
      tomador_ie: '',
      tomador_razao: 'ACME',
      tomador_fantasia: 'ACME',
      tomador_endereco: 'Rua de Asfalto',
      tomador_numero: '100',
      tomador_complemento: 'Fundos',
      tomador_bairro: 'Bairro Feliz',
      tomador_CEP: '111.331.155-00',
      tomador_cod_cidade: '3127107',
      tomador_fone: '3499998888',
      tomador_ramal: '21',
      tomador_fax: '',
      tomador_ramal_fax: ''
    }
  end

  def provider_params
    {
      ccm: '123',
      cnpj: '20.796.048/0001-65',
      senha: 'password',
      crc: '456',
      crc_estado: 'SP'
    }
  end

  def invoice_data_params
    {
      aliquota_simples: '4',
      id_sis_legado: '123',
      servico: '105',
      situacao: 'tp',
      valor: '10.00',
      base: '100,5',
      descricaoNF: 'Teste NF'
    }
  end

end
