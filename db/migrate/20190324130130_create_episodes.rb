class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title, null: false
      t.text :plot, null: false
      t.integer :number, null: false
      t.references :season, foreign_key: true

      t.timestamps
    end

    add_index :episodes, :title, unique: true
    add_index :episodes, :number, unique: true
  end
end
