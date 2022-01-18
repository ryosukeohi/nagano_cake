class Genre < ApplicationRecord
  has_many :items

  enum name_method: { baked_sweets: 1, cake: 2, pudding: 3, candy: 4}
end
