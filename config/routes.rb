Rails.application.routes.draw do

  resources :semester

  resources :courses

  resources :tasks

  resources :admin

  resources :evaluation_criteriums

  resources :evaluation_forms
  
  resources :evaluation_results

  resources :colleges

  resources :departments

  resources :users

  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
