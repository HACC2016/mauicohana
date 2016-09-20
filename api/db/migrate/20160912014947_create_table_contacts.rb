class CreateTableContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :external_id
      t.integer :company_id
      t.string :title
      t.string :full_name
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :phone_1
      t.string :phone_2
      t.string :phone_type_1
      t.string :phone_type_2
      t.boolean :primary_contact
      t.datetime :last_updated
      t.timestamps
    end
  end
end
