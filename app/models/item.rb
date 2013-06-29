class Item < ActiveRecord::Base
  attr_accessible :price, :name, :real, :weight, :description

  validates :price, { numericality: { greater_than: 0, allow_nil: true} }
  # same
  #validates :price, numericality: { greater_than: 0, allowed_nil: true}
  validates :name, :description, presence: true
  
  belongs_to :category

  after_initialize { puts "initialized" } # Item.new; Item.first
  after_save       { puts "saved"    } # Item.save; Item.create; item.update_attributes
  after_create     { puts "created" 
  					 # ItemMailer.new_item_created(self).deliver 
  					 # category.inc(:items_count, 1) # increment
  					} 
  after_update     { puts "updated"  } 
  after_destroy    { puts "destroyed"
  					 # category.inc(:items_count, -1) 
  				   } # item.destoy



end 
