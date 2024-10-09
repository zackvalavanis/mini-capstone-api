Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  #Products
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  #Suppliers
  get "/suppliers" => "suppliers#index"
  patch "/suppliers/:id" => "suppliers#update"
  post "/suppliers" => "suppliers#create"
  #images
  get "/images" => "images#index"
  patch "/images/:id" => "images#update"
  post "/images" => "images#create"
  #Users
  post "/users" => "users#create"
  delete "/users/:id" => "users#destroy"
  #Sessions 
  post "/sessions" => "sessions#create"
  #Orders
  get 'orders' => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"
  delete '/orders/:id' => "orders#destroy"
  #Carted_products
  get "/carted_products" => "carted_products#index"
  delete "/carted_products/:id" => "carted_products#destroy"
  patch "/carted_products/:id" => "carted_products#update"
  post "/carted_products" => "carted_products#create"

  
  # Defines the root path route ("/")
  # root "posts#index"
end


# #HTTP Verb	Path	Controller#Action	Used for

# GET	/photos	photos#index	display a list of all photos

# GET	/photos/new	photos#new	return an HTML form for creating a new photo

# POST	/photos	photos#create	create a new photo

# GET	/photos/:id	photos#show	display a specific photo

# GET	/photos/:id/edit	photos#edit	return an HTML form for editing a photo

# PATCH/PUT	/photos/:id	photos#update	update a specific photo

# DELETE	/photos/:id	photos#destroy	delete a specific photo