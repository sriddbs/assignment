class PurchaseLineItem < ApplicationRecord
  validates_presence_of :price
  validates_presence_of :purchase_id
  validates_presence_of :video_quality
  validates_presence_of :content_id
  validates_presence_of :content_type

  belongs_to :purchase
  belongs_to :content, polymorphic: true
end
