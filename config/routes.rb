Rails.application.routes.draw do
  
  get "/evaluation", to: "evaluations#index"
  get "/evaluation/evaluate/:id", to: "evaluations#evaluate"

  resources :head_of_departments

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

  resources :instructors

  resources :students

  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"

  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
