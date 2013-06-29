class Item < ActiveRecord::Base

  attr_accessible :price, :name, :real, :weight, :description

  validates :price, numericality: { greater_than: 0, allowed_nil: true}
  validates :name, presence: true

end 
