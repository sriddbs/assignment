class LibraryContent < ApplicationRecord
  validates_presence_of :library_id
  validates_presence_of :content_id

  belongs_to :library
  belongs_to :content, polymorphic: true
end
