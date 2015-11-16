module Sigiss
  class IBGE

    class << self

      def get_code(name)
        return if name.nil?
        cities.each do |city, code|
          return code if city == name.downcase
        end
        nil
      end

      def cities
        YAML.load_file(File.join(Sigiss.root, 'cities.yml'))
      end

    end

  end
end
