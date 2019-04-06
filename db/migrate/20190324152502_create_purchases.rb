class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.decimal :price, precision: 8, scale: 2, null: false
      t.references :user, foreign_key: true, null: false
      t.date :validity_starts_on, null: false
      t.date :validity_expires_on, null: false
      t.timestamps
    end
  end
end
