class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :title, null: false
      t.text :plot, null: false

      t.timestamps
    end

    add_index :seasons, :title, unique: true
  end
end
