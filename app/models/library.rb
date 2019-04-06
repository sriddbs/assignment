class Library < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :content_id
  validates_presence_of :content_type
  validates_presence_of :validity_starts_on
  validates_presence_of :validity_expires_on

  belongs_to :user
  belongs_to :content, polymorphic: true
end
