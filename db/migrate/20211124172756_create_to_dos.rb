class CreateToDos < ActiveRecord::Migration[6.1]
  def change
    create_table :to_dos do |t|
      t.string :text, null: false
      t.boolean :is_completed
      t.references :project, default: false

      t.timestamps
    end
  end
end
