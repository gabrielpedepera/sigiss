module Sigiss
  module City
    class Marilia

      attr_accessor :url

      def initialize(environment)
        @url = urls[environment]
      end

      def urls
        {
          test: 'https://testemarilia.sigiss.com.br/testemarilia/ws/sigiss_ws.php?wsdl',
          production: 'https://marilia.sigiss.com.br/marilia/ws/sigiss_ws.php?wsdl'
        }
      end

    end
  end
end
