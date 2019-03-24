class Purchase < ApplicationRecord
  validates_presence_of :price
  validates_presence_of :user_id

  belongs_to :user
  has_many :purchase_line_items
end
