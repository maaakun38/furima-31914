class PurchaseBuyer

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality, :address, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }


  def save
    Purchase.create(user_id: user_id,product_id: product_id)
    Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
  
end
