class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, dependent: :destroy

  TAX_RATE = 0.10 #税率10%

  def price_with_tax
    (price * (1 + TAX_RATE)).floor
  end  
end
