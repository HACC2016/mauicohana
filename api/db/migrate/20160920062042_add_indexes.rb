class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :categorizations, :company_id
    add_index :categorizations, :category_id
    add_index :categories, :parent_id
    add_index :companies, :external_id
    add_index :contacts, :company_id
    add_index :user_companies, :user_id
    add_index :user_companies, :company_id
  end
end
