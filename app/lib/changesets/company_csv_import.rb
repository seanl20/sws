module Changesets
  class CompanyCsvImport
    def self.map(tuple)
      tuple.select { |attr| Company.attribute_names.include?(attr.to_s) }
    end
  end
end
