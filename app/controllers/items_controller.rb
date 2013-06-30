class ItemsController < ApplicationController
  
  def index
    @items = Item.all	
  end

  # /items/1 GET
  def show
    unless @item = Item.where(id: params[:id]).first
      render text: "Page not found", status: 404
    end
  end

  # /items/new GET
  # to create
  def new 
    @item = Item.new
  end

  # /items/1/edit GET
  # to update
  def edit
    
  end

  # /items POST
  def create
    # render text: params.inspect
  	@item = Item.create(params[:item])
  	if @item.errors.empty?
  	  redirect_to item_path(@item) # url: items/:id; one more "query"
  	else
  	  render "new" # not "miss variables"
  	end
  end

  # /items/1 PUT
  def update
    
  end

  # /items/1 DELETE
  def destroy
    
  end
  
end
