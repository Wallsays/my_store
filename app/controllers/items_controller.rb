class ItemsController < ApplicationController
  
  def index
    @items = Item.all	
	# plain text rendering
    render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>") 
  end

  def create
  	# same functionality except of format req
  	# http://localhost:3000/items/create?description=good+car&price=500000&weight=0&real=1
  	# http://localhost:3000/items/create?item[name]=car1&item[description]=good+car&item[price]=500000&item[weight]=0&item[real]=1
 	# i.e. hash in hash

  	# @item = Item.create(name: params[:name], description: params[:description], price: params[:price], real: params[:real], weight: params[:weight])
  	@item = Item.create(params[:item])

  	# last checks if all validations is OK
  	render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  end
  
end
