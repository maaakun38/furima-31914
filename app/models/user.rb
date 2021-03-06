class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    

    with_options presence: true do
      validates :nickname
      validates :birth_date
    end
      
    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do 
      validates :first_name
      validates :last_name
    end
      
    with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/} do
      validates :first_furigana
      validates :last_furigana
    end
      

end
