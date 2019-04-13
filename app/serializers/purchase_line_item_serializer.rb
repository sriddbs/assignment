class PurchaseLineItemSerializer < ActiveModel::Serializer
  attributes :id, :content_id, :content_type, :purchase_id, :created_at
end
