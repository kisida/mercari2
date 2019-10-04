class Item < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :category
  has_many :item_images, :dependent => :destroy
  accepts_nested_attributes_for :item_images

  enum condition: { "新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5 }
  enum postage: { "送料込み(出品者負担)": 0, "着払い(購入者負担)": 1 }
  enum shipping: { "未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3, "普通郵便": 4 }
  enum area: { "大阪府": 0, "京都府": 1, "奈良県": 2, "兵庫": 3, "和歌山": 4, "げじげじ": 5 }
  enum day_before_shippment: { "1~2日で発送": 0, "2~3日で発送": 1, "4~5日で発送": 2 }
end
