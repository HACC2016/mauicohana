class CompanySerializer < ActiveModel::Serializer
  attributes(*Company.attribute_names.map(&:to_sym))
end
