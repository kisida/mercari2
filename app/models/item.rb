class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :item_images

  enum condition: { new_item: 0, near_new: 1, non_dirt: 2, little_dirty: 3, dirt: 4, more_dirty: 5 }
  enum postage: { in_postage: 0, after_delivery: 1 }
  enum shipping: { undecided: 0, rakuraku: 1, yumail: 2, pack: 3, normal: 4 }
  enum area: { Osaka: 0, Kyoto: 1, Nara: 2, Hyogo: 3, Wakayama: 4, Gejigeji: 5 }
  enum day_before_shippment: { day1: 0, day2: 1, day4: 2 }
end
