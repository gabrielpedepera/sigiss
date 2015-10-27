require 'savon'
module Sigiss
  module Integration

    def issue
      execute do
        client = Savon.client(wsdl: gateway.url, convert_request_keys_to: :none)
        response = client.call(:gerar_nota, message: data_to_issue)
        { success: true, body: response.body }
      end
    end

    def data_to_issue
      { DescricaoRps: provider.to_hash.merge(taker.to_hash).merge(data.to_hash) }
    end

    protected

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
