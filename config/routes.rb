Rails.application.routes.draw do

  scope module: "public" do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    get "customers/my_page" => "customers#show"
    get "customers/info/edit" => "customers#edit"
    get "customers/info" => "customers#update"
    get "customers/confirm" => "customers#confirm"
    patch "customers/withdraw" => "/customers#withdraw"
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
  end  

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:passwords, :registrations], controllers: {
    sessions: "admin/sessions"
  }

  
  
end
