class Room < ApplicationRecord
 has_many_attached :images
 has_many :reservations, dependent: :destroy
 has_many :users, through: :reservations

 def self.search(search,keyword)
  
  if search != "" and keyword !=""
    Room.where("room_address LIKE ?", "%#{search}%").where("room_info LIKE ? or room_name LIKE ?", "%#{keyword}%", "%#{keyword}%")
  elsif keyword ==""
    Room.where("room_address LIKE ?", "%#{search}%")
  elsif search == ""
    Room.where("room_info LIKE ? or room_name LIKE ?", "%#{keyword}%", "%#{keyword}%")
  else
    Room.all
  end
 end

 validates :room_name,presence: true
 validates :room_info,presence: true
 validates :room_price,presence: true,numericality: { only_integer: true,greater_than: 0 }
 validates :room_address,presence: true
 validates :create_id,presence: true

end
