class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.references :user, foreign_key: true
      t.references :content, polymorphic: true, index: true
      t.date :validity_starts_on
      t.date :validity_expires_on
      t.timestamps
    end
  end
end
