class CreateSchoolTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :school_types do |t|
      t.string :school_type

      t.timestamps
    end
  end
end
