class ItemsController < ApplicationController
  
  before_filter :find_item,      only: [:show, :edit, :update, :destroy, :upvote] # , :crop_image
  before_filter :check_if_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item # in var will be obj ActiveRecordRelation for different queries
    @items = @items.where('price >= ?', params[:price_from])       if params[:price_from]
    @items = @items.where('created_at >= ?', 1.day.ago)            if params[:today]
    @items = @items.where('votes_count >= ?', params[:votes_from]) if params[:votes_from]
    @items = @items.order("votes_count DESC", "price").limit(50)
    @items = @items.includes(:image) # eager loading - ленивая загрузка
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
  	@item = Item.create(item_params)
  	if @item.errors.empty?
  	  redirect_to item_path(@item) # url: items/:id; one more "query"
      # redirect_to crop_image_item_path(@item)
  	else
  	  render "new" # not "miss variables"
  	end
  end

  # /items/1 PUT
  def update
    @item.update_attributes(item_params)
  	if @item.errors.empty?
      flash[:success] = "Item successfully updated!"
      redirect_to item_path(@item) 
      # redirect_to crop_image_item_path(@item)
    else
      flash.now[:error] = "You made mistakes in ypur form! Please correct them."
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

    def item_params
      params.require(:item).permit(:price, :weight, :real, 
                                   :name, :decription, :image)
      # params.require(:item).permit! # permit all
    end

end
