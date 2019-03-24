class Season < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :plot

  has_many :episodes
end
