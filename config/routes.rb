Rails.application.routes.draw do

  scope module: "public" do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    get "customers/my_page" => "customers#show"
    get "customers/info/edit" => "customers#edit"
    patch "customers/info" => "customers#update"
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    resources :cart_items, only: [:create, :index, :update, :destroy] do
      collection do
        delete "destroy_all"
      end
    end
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
  end  

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    patch "admin/order_details/:id" => "order_details#update"
  end  

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:passwords, :registrations], controllers: {
    sessions: "admin/sessions"
  }

  
  
end
