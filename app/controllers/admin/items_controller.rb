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
      render :new  
    end  
  end

  def index
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end  
    
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end

end
