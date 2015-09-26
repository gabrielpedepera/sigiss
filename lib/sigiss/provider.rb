require 'lotus/validations'
module Sigiss
  class Provider
    include Lotus::Validations

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
