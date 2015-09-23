module Sigiss
  class Provider
    attr_accessor :ccm,  :cnpj, :senha, :crc, :crc_estado

    def initialize(params = {})
      @ccm = params[:ccm]
      @cnpj = params[:cnpj]
      @senha = params[:senha]
      @crc = params[:crc]
      @crc_estado = params[:crc_estado]
    end

  end
end
