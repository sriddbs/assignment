class LibrarySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :validity_starts_on, :validity_expires_on

  has_many :movies
  has_many :seasons
end
