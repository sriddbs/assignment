class CreatePurchaseLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_line_items do |t|
      t.decimal :price, precision: 8, scale: 2, null: false
      t.string :video_quality, null: false
      t.references :content, polymorphic: true, index: true
      t.references :purchase, foreignt_key: true, null: false

      t.timestamps
    end
  end
end
