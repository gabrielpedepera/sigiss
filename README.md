# Sigiss

[![Build Status](https://travis-ci.org/gabrielpedepera/sigiss.svg?branch=master)](https://travis-ci.org/gabrielpedepera/sigiss) [![Code Climate](https://codeclimate.com/github/gabrielpedepera/sigiss/badges/gpa.svg)](https://codeclimate.com/github/gabrielpedepera/sigiss) [![Test Coverage](https://codeclimate.com/github/gabrielpedepera/sigiss/badges/coverage.svg)](https://codeclimate.com/github/gabrielpedepera/sigiss/coverage)

Ruby gem para integração com o WebService para NFS-e do SIGISS.

Atualmente suportando as seguintes cidades:

    - Bauru - SP
    - Botucatu - SP
    - Marília - SP
    - Londrina - PR
    - Rio Grande - RS

Obs.: A gem foi desenvolvida baseada no WebService de [Marília-SP](https://marilia.sigiss.com.br/marilia/ws/sigiss_ws.php) e [Manual]( http://www.bauru.sp.gov.br/arquivos/arquivos_site/sec_financas/nfse_manual_webservice.pdf).
Caso exista divergências na integrações com outras cidades ou a gem contemple outras para integração,
seu PR ou sua informação será muito bem vinda para atualização.

## Instalação

Adicionar ao Gemfile:

```ruby
gem 'sigiss'
```

Executar:

    $ bundle

Ou instalar como:

    $ gem install sigiss

## Uso

#### Definir a cidade (gateway) para emissão da Nota Fiscal:

```ruby
gateway = Sigiss::Gateway.new(:marilia, :test) # Ambiente de teste
gateway = Sigiss::Gateway.new(:marilia, :production) # Ambiente de Produção
```

#### Definir os dados referente ao prestador:

```ruby
params = {
  ccm: '31000',
  cnpj: '90082563000169',
  senha: '12345',
  crc: '',
  crc_estado: ''
}
```

```ruby
provider = Sigiss::Provider.new(params)
```

#### Definir os dados referente ao tomador:

```ruby
params = {
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
  tomador_fone: '1499998888',
  tomador_ramal: '',
  tomador_fax: '',
  tomador_ramal_fax: ''
}
```

```ruby
taker = Sigiss::Taker.new(params)
```

### APIs

#### Emissão
```ruby
invoice = Sigiss::Invoice.new(gateway: gateway, provider: provider, taker: taker)
params = {
  aliquota_simples: '',
  id_sis_legado: '',
  servico: '105',
  situacao: 'tp',
  valor: '10,00',
  base: '10,00',
  descricaoNF: 'Teste NF'
}
invoice.build(issue: params)
invoice.issue!
```

```ruby
invoice.success?
=> true
```

```ruby
invoice.response
=> {:gerar_nota_response=>{:retorno_nota=>{:resultado=>"0", :nota=>"0", :link_impressao=>{:"@xsi:type"=>"xsd:string"}, :"@xsi:type"=>"tns:tcRetornoNota"}, :descricao_erros=>{:item=>{:id=>"0", :descricao_processo=>"Processo Geral", :descricao_erro=>"Senha não pode ser verificada", :"@xsi:type"=>"tns:tcEstruturaDescricaoErros"}, :"@xsi:type"=>"SOAP-ENC:Array", :"@soap_enc:array_type"=>"tns:tcEstruturaDescricaoErros[1]"}, :"@xmlns:ns1"=>"urn:sigiss_ws"}}
```

#### Consulta
```ruby
invoice = Sigiss::Invoice.new(gateway: gateway, provider: provider)
params = {
  nota: '13114',
  serie: '1',
  autenticidade: '2ZZGUTL0',
  valor: '10,00'
}
invoice.build(fetch: params)
invoice.fetch!
```

```ruby
invoice.success?
=> true
```

```ruby
invoice.response
=> {:consultar_nota_valida_response=>{:retorno_nota=>{:resultado=>"0", :nota=>"0", :link_impressao=>{:"@xsi:type"=>"xsd:string"}, :"@xsi:type"=>"tns:tcRetornoNota"}, :descricao_erros=>{:item=>{:id=>"0", :descricao_processo=>"Processo Geral", :descricao_erro=>"Valor da nota precisa ser informada.", :"@xsi:type"=>"tns:tcEstruturaDescricaoErros"}, :"@xsi:type"=>"SOAP-ENC:Array", :"@soap_enc:array_type"=>"tns:tcEstruturaDescricaoErros[1]"}, :"@xmlns:ns1"=>"urn:sigiss_ws"}}
```

#### Cancelamento
```ruby
invoice = Sigiss::Invoice.new(gateway: gateway, provider: provider)
params = {
  nota: '13114',
  motivo: 'Falha no Engano',
  email: 'email@tomador.com'
}
invoice.build(cancel: params)
invoice.cancel!
```

```ruby
invoice.success?
=> true
```

```ruby
invoice.response
=> {:cancelar_nota_response=>{:retorno_nota=>{:resultado=>"0", :nota=>"0", :link_impressao=>{:"@xsi:type"=>"xsd:string"}, :"@xsi:type"=>"tns:tcRetornoNota"}, :descricao_erros=>{:item=>{:id=>"0", :descricao_processo=>"Processo Geral", :descricao_erro=>"Dados de identificação não encontrados.", :"@xsi:type"=>"tns:tcEstruturaDescricaoErros"}, :"@xsi:type"=>"SOAP-ENC:Array", :"@soap_enc:array_type"=>"tns:tcEstruturaDescricaoErros[1]"}, :"@xmlns:ns1"=>"urn:sigiss_ws"}}
```

## Contribuição

Reportar bugs e Pull Requests são bem vindos no Github em https://github.com/gabrielpedepera/sigiss.


## Licença

A gem está disponível como open source sobre os termos de [MIT License](http://opensource.org/licenses/MIT).
