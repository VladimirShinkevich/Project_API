Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :to_dos, shallow: true
  end

end
