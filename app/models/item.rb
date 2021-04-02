class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  
  
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end  
  with_options numericality: { other_than: 1 , message: "Select" } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :delivery_id
  end
end
