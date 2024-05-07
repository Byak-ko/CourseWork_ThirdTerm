class ItemInfo < ApplicationRecord
    has_many :orders, class_name: "OrderInfo"   
    has_many :order_infos
    has_one_attached :image

    enum category: {
        fish: "Риба",
        food: "Корм",
        aquarium: "Акваріум",
        medical_supplies: "Медичні засоби",
        decoration: "Оздоблення",
        other: "Інше"
      }

      def category_value
        ItemInfo.categories[self.category]
      end
end
