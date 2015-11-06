module Helpers

  def taker_params
    {
      tomador_tipo: '2',
      tomador_cnpj: '08600061822',
      tomador_email: 'email@tomador.com',
      tomador_im: '',
      tomador_ie: '',
      tomador_razao: 'Pagador de Impostos',
      tomador_fantasia: '',
      tomador_endereco: 'Rua de Asfalto',
      tomador_numero: '100',
      tomador_complemento: 'Fundos',
      tomador_bairro: 'Bairro Feliz',
      tomador_CEP: '17512752',
      tomador_cod_cidade: '3127107',
      tomador_fone: '3499998888',
      tomador_ramal: '',
      tomador_fax: '',
      tomador_ramal_fax: ''
    }
  end

  def provider_params
    {
      ccm: '31000',
      cnpj: '90082563000169',
      senha: '12345',
      crc: '',
      crc_estado: ''
    }
  end

  def cancel_data
    {
      nota: '13114',
      motivo: 'Falha no Engano',
      email: 'hommer@simpsons.com'
    }
  end

  def cancel_request
    {
      DadosCancelaNota: {
        ccm: '31000',
        cnpj: '90082563000169',
        senha: '12345',
        nota: '13114',
        motivo: 'Falha no Engano',
        email: 'hommer@simpsons.com'
      }
    }
  end

  def fetch_data
    {
      nota: '13114',
      serie: '1',
      autenticidade: '2ZZGUTL0',
      valor: '10,00'
    }
  end

  def fetch_request
    {
      DadosConsultaNota: {
        nota: '13114',
        serie: '1',
        autenticidade: '2ZZGUTL0',
        valor: '10,00',
        prestador_ccm: '31000',
        prestador_cnpj: '90082563000169'
      }
    }
  end

  def issue_data
    {
      aliquota_simples: '',
      id_sis_legado: '',
      servico: '105',
      situacao: 'tp',
      valor: '10,00',
      base: '10,00',
      descricaoNF: 'Teste NF'
    }
  end

  def issue_request
    {
      DescricaoRps: {
        ccm: "31000",
        cnpj: "90082563000169",
        senha: "12345",
        crc: "",
        crc_estado: "",
        tomador_tipo: "2",
        tomador_cnpj: "08600061822",
        tomador_email: "email@tomador.com",
        tomador_im: "",
        tomador_ie: "",
        tomador_razao: "Pagador de Impostos",
        tomador_fantasia: "",
        tomador_endereco: "Rua de Asfalto",
        tomador_numero: "100",
        tomador_complemento: "Fundos",
        tomador_bairro: "Bairro Feliz",
        tomador_CEP: "17512752",
        tomador_cod_cidade: "3127107",
        tomador_fone: "3499998888",
        tomador_ramal: "",
        tomador_fax: "",
        tomador_ramal_fax: "",
        aliquota_simples: "",
        id_sis_legado: "",
        servico: "105",
        situacao: "tp",
        valor: "10,00",
        base: "10,00",
        descricaoNF: "Teste NF"
      }
    }
  end

end
