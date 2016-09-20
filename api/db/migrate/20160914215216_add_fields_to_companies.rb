class AddFieldsToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :tob_grower, :boolean
    add_column :companies, :tob_distributor, :boolean
    add_column :companies, :tob_wholesaler, :boolean
    add_column :companies, :tob_processor, :boolean
    add_column :companies, :tob_manufacturer, :boolean
    add_column :companies, :tob_retailer, :boolean
    add_column :companies, :tob_other, :boolean
    add_column :companies, :tob_otherdesc, :string
    add_column :companies, :serv_mailorder, :boolean
    add_column :companies, :serv_delivery, :boolean
    add_column :companies, :serv_packing, :boolean
    add_column :companies, :serv_growing, :boolean
    add_column :companies, :serv_labeling, :boolean
    add_column :companies, :serv_bulk, :boolean
    add_column :companies, :serv_retail, :boolean
    add_column :companies, :serv_other, :boolean
    add_column :companies, :serv_other_desc, :string
  end
end
