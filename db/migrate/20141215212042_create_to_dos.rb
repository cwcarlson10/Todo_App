class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :title
      t.string :category
      t.string :priority
      t.boolean :is_completed

      t.timestamps
    end
  end
end
