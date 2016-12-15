class AddTotalAndNumberReportingToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :total, :integer
    add_column :students, :number_in_reporting_districts, :integer
  end
end
