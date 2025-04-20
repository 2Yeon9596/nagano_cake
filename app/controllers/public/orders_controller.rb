class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def comfirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
  end

  def create
  end
  
  def index
  end
  
  def show
  end
  
  
  
  def complete
  end
 
end
