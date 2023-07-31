# Rails.application.routes.draw do
#   root to: "owners#index"

#   resources :owners do
#     resources :machines, only: [:index]
#   end

#   resources :machines, only: [:show] 
#   # resources :snack_machines, only: [:update]
#   # patch "/machines/:id", to "machines#update"
#   patch "/snack_machines/:id", to: "snack_machines#update"
# end
Rails.application.routes.draw do
  root to: "owners#index"

  resources :owners do
    resources :machines, only: [:index]
  end

  resources :machines, only: [:show] 
  resource :snack_machines, only: [:update]
  
  resources :snacks, only: [:show]

end