Rails.application.routes.draw do
  resources :process_trainings
  resources :trainings
  resources :exercises
  devise_for :users
  devise_for :coaches
  resources :users, :coaches, only: [:show, :edit, :update, :index] do
    get 'chart', on: :member
    get 'dasboards', on: :collection
    get 'statistics', on: :member

    resources :personal_characteristics
  end
  resources :groups do
    resources :schedules

  end
  resources :products
  resources :rations 
 
  get 'add_to' => 'rations#add_to'
  delete 'delete' => 'rations#delete'
  get 'add_to/training' => 'trainings#add_to'
  delete 'delete/training' => 'trainings#delete'
  root 'static_pages#home'
 


  
  get "hello" => "static_pages#dasboard"
  

end
