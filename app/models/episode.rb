class Episode < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :plot
  validates_presence_of :number

  belongs_to :season
end
