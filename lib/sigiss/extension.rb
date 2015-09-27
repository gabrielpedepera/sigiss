module Sigiss
  module Extension
    def to_hash
      hash = {}
      instance_variables.each { |var| hash[var.to_s.delete("@").to_sym] = instance_variable_get(var) }
      hash
    end
  end
end

