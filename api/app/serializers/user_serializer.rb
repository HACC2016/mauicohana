class UserSerializer < ActiveModel::Serializer
  attributes(:id, :last_sign_in_at, :confirmed_at, :name, :nickname, :image, :email, :created_at, :updated_at, :admin)

  has_many :companies

end
