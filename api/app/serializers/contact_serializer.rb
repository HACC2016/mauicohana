class ContactSerializer < ActiveModel::Serializer
  attributes(*Contact.attribute_names.map(&:to_sym))
end
