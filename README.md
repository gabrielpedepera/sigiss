# Sigiss

[![Build Status](https://travis-ci.org/gabrielpedepera/sigiss.svg?branch=master)](https://travis-ci.org/gabrielpedepera/sigiss) [![Code Climate](https://codeclimate.com/github/gabrielpedepera/sigiss/badges/gpa.svg)](https://codeclimate.com/github/gabrielpedepera/sigiss) [![Test Coverage](https://codeclimate.com/github/gabrielpedepera/sigiss/badges/coverage.svg)](https://codeclimate.com/github/gabrielpedepera/sigiss/coverage)

Ruby GEM para integração com o WebService para NFS-e do SIGISS.

Atualmente suportando as seguintes cidades:

    Bauru - SP
    Botucatu - SP
    Marília - SP
    Londrina - SP
    Rio Grande - RS

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
provider = Sigiss::Provider.new(params)
```

#### Definir os dados referente ao tomador:

```ruby
taker = Sigiss::Taker.new(params)
```

### APIs

#### Emissão
```ruby
invoice = Sigiss::Invoice.new(gateway: gateway, provider: provider, taker: taker)
invoice.build(issue: params)
invoice.issue!
```

#### Consulta
```ruby
invoice = Sigiss::Invoice.new(gateway: gateway, provider: provider)
invoice.build(fetch: params)
invoice.fetch!
```

#### Cancelamento
```ruby
invoice = Sigiss::Invoice.new(gateway: gateway, provider: provider)
invoice.build(cancel: params)
invoice.cancel!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sigiss.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

