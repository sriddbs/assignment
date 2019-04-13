class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :validity_starts_on, :validity_expires_on

  has_many :purchase_line_items
end
