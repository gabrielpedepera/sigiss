require 'savon'
module Sigiss
  module Integration

    def issue!
      send(:gerar_nota, data_issue)
    end

    def fetch!
      send(:consultar_nota_valida, data_fetch)
    end

    def data_fetch
      { DadosConsultaNota: provider.to_fetch.merge(data.to_hash) }
    end

    def data_issue
      { DescricaoRps: provider.to_hash.merge(taker.to_hash).merge(data.to_hash) }
    end

    protected

    def send(action, data)
      execute do
        client = Savon.client(wsdl: gateway.url, convert_request_keys_to: :none)
        response = client.call(action, message: data)
        { success: true, body: response.body }
      end
    end

    def execute(&block)
      yield
    rescue Timeout::Error => e
      { success: false, body: { error: e.message } }
    rescue Savon::SOAPFault => e
      { success: false, body: { error: e.message } }
    rescue Exception => e
      { success: false, body: { error: e.message } }
    end
  end

end
