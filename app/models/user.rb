class User < ApplicationRecord
  after_create :new_cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders

  def new_cart
    Cart.create(user_id: self.id)
  end

end
