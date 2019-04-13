class CreateLibraryContents < ActiveRecord::Migration[5.2]
  def change
    create_table :library_contents do |t|
      t.references :library, foreign_key: true
      t.references :content, polymorphic: true, index: true
      t.timestamps
    end
  end
end
