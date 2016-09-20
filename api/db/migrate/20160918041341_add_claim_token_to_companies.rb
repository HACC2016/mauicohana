class AddClaimTokenToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :claim_token, :string
  end
end
