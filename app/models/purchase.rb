class Purchase < ApplicationRecord
  belongs_to :user
  belong_to  :product
  has_one :buyer
end
