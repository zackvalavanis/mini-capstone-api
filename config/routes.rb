Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"
  patch "/suppliers/:id" => "suppliers#update"
  post "/suppliers" => "suppliers#create"

  get "/images" => "images#index"
  patch "/images/:id" => "images#update"
  post "/images" => "images#create"

  post "/users" => "users#create"

  

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