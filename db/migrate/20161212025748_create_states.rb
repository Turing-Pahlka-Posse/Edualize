class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :st_name
      t.string :st_abbrev

      t.timestamps
    end
  end
end
