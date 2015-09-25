require 'spec_helper'

describe Sigiss::IBGE do

  context 'recover code city by name' do
    it 'Frutal' do
      expect(Sigiss::IBGE.get_code('Frutal')).to eq('3127107')
    end

    it 'Abadia de Goiás' do
      expect(Sigiss::IBGE.get_code('Abadia de Goiás')).to eq('5200050')
    end

    it 'Marília' do
      expect(Sigiss::IBGE.get_code('Marília')).to eq('3529005')
    end

  end

end
