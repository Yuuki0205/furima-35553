class PurchaseHistoryAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token
 # ここにバリデーションの処理を書く
 with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city
  validates :address
  validates :phone_number, numericality: true, length: { maximum: 11 }
  validates :token
  validates :user_id
  validates :item_id
 end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
    # 各テーブルにデータを保存する処理を書く
  end
end


