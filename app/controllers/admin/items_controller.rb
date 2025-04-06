class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品が登録されました。"
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :new, status: :unprocessable_entity  
    end  
  end

  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品が更新されました。"
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :edit, status: :unprocessable_entity
    end    
  end  
    
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end

end
