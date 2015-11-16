require 'yaml'
require 'active_model'
module Sigiss
  class Gateway
    include ActiveModel::Validations
    include ActiveModel::Validations::Callbacks

    attr_accessor :environment
    attr_reader :name, :url

    validates_presence_of :name, :url, :environment

    before_validation :validate_if_gateway_exists

    def initialize(name = nil, environment = :test)
      @name = name
      @url = url_webservice(name, environment)
      @environment = environment
    end

    def url_webservice(name, environment)
      YAML.load_file(File.join(Sigiss.root, 'configs.yml'))[environment.to_s][name.to_s]
    end

    def validate_if_gateway_exists
      errors.add(:name, :invalid) if @url.nil?
    end

  end
end
