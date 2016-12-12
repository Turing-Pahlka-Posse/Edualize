class CreateMedianExpenditures < ActiveRecord::Migration[5.0]
  def change
    create_table :median_expenditures do |t|
      t.integer :total
      t.string :instruction_related
      t.string :support_services
      t.references :school_type, foreign_key: true
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
