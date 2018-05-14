Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get('/', {to: 'welcome#index', as: 'root'})
  get('/about_us', {to: 'welcome#about'})
  get('/contact_us', {to: 'contact_us#new'})
  post('/contact_us/submit', {to: 'contact_us#create'})   
 

   resources :products do
    resources :reviews
   end
    # resources :reviews
    # the magic has replaced all of the following
  
# replacing the following with 'resources' method above 

# get '/products/new', to: 'products#new', as: :new_product 
# post "/products", to: "products#create", as: :products 
# get '/products/:id', to: 'products#show', as: :product
# get '/products', to: 'products#index' #?# , as: :index
# get '/products/:id/edit', to: 'products#edit', as: :edit_product
# patch '/products/:id', to: 'products#update'
# delete "products/:id", to: "products#destroy"

end
