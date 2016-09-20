class ChangeActiveDefaultOnCompanies < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:companies, :active, false)
  end
end
