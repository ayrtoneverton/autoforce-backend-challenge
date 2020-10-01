class Order < ApplicationRecord
  belongs_to :user
  belongs_to :deliveryService
  belongs_to :purchaseChannel
  belongs_to :batch
end
