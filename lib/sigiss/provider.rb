require 'lotus/validations'
module Sigiss
  class Provider
    include Lotus::Validations

    attr_accessor :ccm,  :cnpj, :senha, :crc, :crc_estado

    validates :ccm,  presence: true
    validates :cnpj, presence: true
    validates :senha, presence: true

    def initialize(params = {})
      @ccm = params[:ccm]
      @cnpj = params[:cnpj]
      @senha = params[:senha]
      @crc = params[:crc]
      @crc_estado = params[:crc_estado]
    end

  end
end
