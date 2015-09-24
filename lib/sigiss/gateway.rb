require 'yaml'
module Sigiss
  class Gateway
    attr_accessor :name, :url, :environment

    def initialize(name, environment)
      @name = name
      @url = get_url(name, environment)
      @environment = environment
    end

    def get_url(name, environment)
      YAML.load_file(File.join(Sigiss.root, 'configs.yml'))[environment.to_s][name.to_s]
    end

  end
end
