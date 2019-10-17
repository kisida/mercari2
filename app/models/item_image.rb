class ItemImage < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImageUploader
  has_many :comments
end
