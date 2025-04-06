class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, dependent: :destroy

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, presence: true



  TAX_RATE = 0.10 #税率10%

  def price_with_tax
    (price * (1 + TAX_RATE)).floor
  end  
  
end
