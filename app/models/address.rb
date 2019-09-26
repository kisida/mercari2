class Address < ApplicationRecord
  belongs_to :user

  validates :area_number, :prefecture, :municipalities, :address_number, presence: true

end
