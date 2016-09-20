class Category < ActiveRecord::Base
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category'
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, presence: true
end

