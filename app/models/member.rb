class Member < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_participations, dependent: :destroy
  has_many :events, through: :event_participations

  has_many :created_orders, class_name: "OrderInfo", foreign_key: "creator_id"
  has_many :purchased_orders, class_name: "OrderInfo", foreign_key: "buyer_id"
  has_many :orders, class_name: "OrderInfo", foreign_key: "creator_id"
  has_many :club_documents

  def admin?
    role == 'Адміністратор'
  end
end
