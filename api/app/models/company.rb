class Company < ActiveRecord::Base
  has_many :contacts
  has_many :user_companies, dependent: :destroy
  has_many :users, through: :user_companies
  has_many :categorizations
  has_many :categories, through: :categorizations

  scope :active, -> { where(active: true) }

  has_secure_token :claim_token
end
