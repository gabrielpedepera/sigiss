require 'lotus/validations'
require 'sigiss/extension'
module Sigiss
  class Provider
    include Lotus::Validations
    include Sigiss::Extension

    attr_accessor :ccm,  :cnpj, :senha, :crc, :crc_estado

    validates :ccm,  presence: true
    validates :cnpj, presence: true
    validates :senha, presence: true

    def initialize(attributes = {})
      @ccm = attributes[:ccm]
      @cnpj = attributes[:cnpj]
      @senha = attributes[:senha]
      @crc = attributes[:crc]
      @crc_estado = attributes[:crc_estado]
    end

  end
end
