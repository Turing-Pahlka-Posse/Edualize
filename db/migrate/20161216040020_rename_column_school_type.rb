class RenameColumnSchoolType < ActiveRecord::Migration[5.0]
  def change
    rename_column :school_types, :school_type, :type_of_school
  end
end
