class Batch < ApplicationRecord
  belongs_to :purchaseChannel
  has_many :order
end
