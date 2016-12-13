class AddTotalAndNumberReportingToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :total, :integer
    add_column :districts, :number_reporting, :integer
  end
end
