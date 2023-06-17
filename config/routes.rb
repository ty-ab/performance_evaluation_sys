Rails.application.routes.draw do

  put "/evaluation/end_evaluation/:id", to: "evaluations#end_evaluation", as: "end_evaluation"
  get "/evaluation", to: "evaluations#index"
  get "/evaluation/:id", to: "evaluations#evaluate", as: "evaluate_task"
  post "/evaluation/evaluate", to: "evaluations#create"
  get "/evaluation/result/:id", to: "evaluations#show", as: "evaluation_result"
  # get "/evaluation/result", to: "evaluations#show", as: "evaluation_result"
  

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root to: "static_pages#home"
  get "/help", to: "static_pages#help"

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
