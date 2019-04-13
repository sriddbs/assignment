class Library < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :validity_starts_on
  validates_presence_of :validity_expires_on

  belongs_to :user
  has_many   :library_contents
  has_many   :movies, through: :library_contents, source: :content, source_type: 'Movie'
  has_many   :seasons, through: :library_contents, source: :content, source_type: 'Season'

  scope :active, -> { where('validity_expires_on >= ?', Date.today) }
end
