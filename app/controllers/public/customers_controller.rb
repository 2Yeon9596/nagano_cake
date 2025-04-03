class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def show
  end 
  
  def edit
  end
  
  def update
  end
  
  def unsubscribe
  end
  
  def withdraw
  end  


end
