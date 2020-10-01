class Batch < ApplicationRecord
  belongs_to :purchase_channel
  has_many :order
end
