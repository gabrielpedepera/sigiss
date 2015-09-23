module Sigiss
  class Gateway
    attr_accessor :name, :url, :environment

    def initialize(name, environment)
      @name = name
      @url = Object.const_get("Sigiss::City::#{name.to_s.capitalize}").new(environment).url
      @environment = environment
    end

  end
end
