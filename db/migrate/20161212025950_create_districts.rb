class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.references :school_type, foreign_key: true
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
