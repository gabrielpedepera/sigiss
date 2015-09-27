require 'savon'
module Sigiss
  module Integration
    module ClassMethods

    end

    module InstanceMethods

      def issue
        execute do
          client = Savon.client(wsdl: gateway.url)
          response = client.call(:gerar_nota, message: data_to_issue)
          { success: true, body: response.body }
        end
      end

      def data_to_issue
        { :DescricaoRps => provider.to_h.merge(taker.to_h).merge(data.to_h) }
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

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end
