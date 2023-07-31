class CreateSnackMachines < ActiveRecord::Migration[7.0]
  def change
    create_table :snack_machines do |t|
      t.references :snack, null: false, foreign_key: true
      t.references :machine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
