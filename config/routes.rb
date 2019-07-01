Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tags/:tag', to: 'image#tagged', as: :tagged
  resources :image
  root 'image#index'
end
