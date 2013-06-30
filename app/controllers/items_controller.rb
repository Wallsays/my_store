class ItemsController < ApplicationController
  
  before_filter :find_item,      only: [:show, :edit, :update, :destroy, :upvote]
  before_filter :check_if_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all	
  end

  def expensive
  	@items = Item.where("price > 1000")
  	render "index"
  end

  # /items/1 GET
  def show
    unless @item
      render text: "Page not found", status: 404
    end
  end

  # /items/new GET
  def new 
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
  	@item = Item.create(params[:item])
  	if @item.errors.empty?
  	  redirect_to item_path(@item) # url: items/:id; one more "query"
  	else
  	  render "new" # not "miss variables"
  	end
  end

  # /items/1 PUT
  def update
    @item.update_attributes(params[:item])
  	if @item.errors.empty?
  	  redirect_to item_path(@item) 
  	else
  	  render "edit" 
  	end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end
  
  def upvote
  	@item.increment!(:votes_count) # increment by 1 and save to db
  	redirect_to action: "index"
  end

  private

    def find_item
      # @item = Item.find(params[:id])
      # next preferrable than prev line
      @item = Item.where(id: params[:id]).first
      render_404 unless @item 
    end

end
