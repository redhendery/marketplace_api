Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products
      resources :tokens, only: [:create]
      resources :users, only: %i[show create update destroy]
    end
  end
end
