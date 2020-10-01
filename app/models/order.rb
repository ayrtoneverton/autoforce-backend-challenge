class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :delivery_service
  belongs_to :purchase_channel
  belongs_to :batch, optional: true
  validates :reference, :address, :line_items, :total_value, :presence => true
end
