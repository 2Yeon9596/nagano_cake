class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    #ログインしている顧客のカート内商品の集合に一つ追加する
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all 
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = @cart_item.item.id
    #ログインしている顧客の全カート内商品から、パラメータで受け取ったitem_idと一致する商品がないか判別する(一致する場合は↓一致しない新商品の場合はelse)
    if cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
      new_amount = cart_item.amount + @cart_item.amount
      cart_item.update_attribute(:amount, new_amount)
      @cart_item.delete
    else
      @cart_item.save
    end    
    redirect_to cart_items_path
  end  

  def index
    @cart_items = current_customer.cart_items
    @total_payment = 0
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end  

end
