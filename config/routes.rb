Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "/user/task" ,to: "task#index", as: "user_task"
  get "/task/new" ,to: "task#new"
  post "task/create" ,to: "task#create" , as: "new_task" 
  # Defines the root path route ("/")
  # root "articles#index"
end
