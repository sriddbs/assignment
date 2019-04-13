class RemoveContentColumnsFromLibrary < ActiveRecord::Migration[5.2]
  def change
    remove_column :libraries, :content_id
    remove_column :libraries, :content_type
  end
end
