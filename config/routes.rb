Rails.application.routes.draw do
  resources :properties, only: %w(create show index)
end
