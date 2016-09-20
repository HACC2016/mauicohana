class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.integer :external_id
      t.string :name
      t.boolean :active
      t.boolean :omit
      t.boolean :needs_update
      t.datetime :needs_update_sent
      t.datetime :last_updated
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :island
      t.string :phone_1
      t.string :phone_2
      t.string :fax_pre
      t.string :fax
      t.string :website
      t.string :email
      t.boolean :certified
      t.string :country
      t.integer :established_year
      t.string :products
      t.string :products_info
      t.text :notes_1
      t.text :notes_2
      t.boolean :employ
      t.boolean :annual_volume
      t.boolean :exporter
      t.boolean :export_sales
      t.string :title_1
      t.string :salutation_1
      t.string :salutation_2
    end
  end
end
