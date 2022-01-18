class Item < ApplicationRecord
  attachment :image

  has_many :cart_items
  has_many :order_details

  def add_tax_price
        (self.price * 1.10).round
  end
end
