class Item < ActiveRecord::Base

  attr_accessible :price, :name, :real, :weight, :description

  validates :price, numericality: { greater_than: 0, allowed_nil: true}
  validates :name, presence: true

  # можно посмотреть в каких корзинах есть товар
  has_many :positions
  has_many :carts, through: :positions

  has_many :comments, as: :commentable

end 
