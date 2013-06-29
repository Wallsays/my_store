class ItemsController < ApplicationController
  
  def index
    @items = Item.all	
	# plain text rendering
    render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>") 
  end
  
end
