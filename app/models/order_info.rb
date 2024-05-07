class OrderInfo < ApplicationRecord
  belongs_to :creator, class_name: "Member", foreign_key: "creator_id"
  belongs_to :buyer, class_name: "Member", foreign_key: "buyer_id", optional: true
  belongs_to :item_info, class_name: "ItemInfo", foreign_key: "item_info_id", optional: true

end
