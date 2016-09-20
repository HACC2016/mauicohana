class UserCompanySerializer < ActiveModel::Serializer
  attributes(*UserCompany.attribute_names.map(&:to_sym))
end
