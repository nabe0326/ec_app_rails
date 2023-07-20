class Product < ApplicationRecord
    validates :name, presence: true
    validates   :price, presence: true
    mount_uploader :image, ImageUploader
end
