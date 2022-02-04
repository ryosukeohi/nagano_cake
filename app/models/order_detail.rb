class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def mid
    item.with_tax_price * quantity
  end
end
