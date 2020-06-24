Rails.application.routes.draw do
  resources :restaurants, only: [ :index, :new, :show, :create ] do
    resources :reviews, only: [ :create ]
    collection do
      get :category, as: :cat
    end
  end
end
