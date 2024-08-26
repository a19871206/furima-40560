class Order < ApplicationRecord
  has_one :seller
  belongs_to :user
  belongs_to :item

end
