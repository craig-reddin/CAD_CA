Rails.application.routes.draw do
  resources :recipes do
    collection do
      
      post 'generate_recipe'
    end
  end
end