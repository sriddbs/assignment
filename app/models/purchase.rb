class Purchase < ApplicationRecord
  EXPIRE_DAYS = 3.days

  validates_presence_of :price
  validates_presence_of :user_id
  validates_presence_of :validity_starts_on
  validates_presence_of :validity_expires_on

  belongs_to :user
  has_many :purchase_line_items
end
