class Movie < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :plot
end
