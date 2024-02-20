Rails.application.routes.draw do
  devise_for :users
  # Routes for the Delivery resource:

  # ROOT
  # Defines the root path route ("/")
  # root to "deliveries#index"
  root to: "deliveries#index"

  # CREATE
  post("/insert_delivery", { :controller => "deliveries", :action => "create" })
  
  # UPDATE
  post("/modify_delivery/:path_id", { :controller => "deliveries", :action => "update" })
  
  # DELETE
  get("/delete_delivery/:path_id", { :controller => "deliveries", :action => "destroy" })
  
  # READ
  get("/deliveries", { :controller => "deliveries", :action => "index" })

  get("/deliveries/:path_id", { :controller => "deliveries", :action => "index" })
  
  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
