Rails.application.routes.draw do
  resources :feedbacks
  resources :carts
  resources :purchased_histories
  resources :courses do
    resources :purchased_histories
    get 'student_index', on: :member, as: :student_index
    get 'teacher_index', on: :member, as: :teacher_index
    # get 'history', to: 'purchased_histories#test'
  end
  resources :teachers do
    resources :feedbacks
    resources :courses do
      post 'register_to_course', on: :member, as: :register_to_course
    end
    resources :purchased_histories
  end
  resources :students do
    get 'add_to_purchased_history', on: :member, as: :add_to_purchased_history, to: 'purchased_histories#add_to_purchase_history'
    post 'add_to_cart', on: :member, as: :add_to_cart, to: 'students#add_to_cart'
    get 'course_catalog', on: :member, as: :course_catalog, to: 'courses#student_index'
    resources :courses do
    end
    resources :feedbacks
    resources :credit_card_info
    resources :purchased_histories
    resources :carts do
      post 'checkout', on: :member, as: :checkout
      delete 'remove_from_cart/:id', on: :member, as: :remove_from_cart, to: 'carts#remove_from_cart'
    end
  end
  resources :admins


  resources :users, only: %i[new create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout', as: :logout
  get 'welcome', to: 'sessions#welcome'
  get 'check_password/:id', as: :check_password,  to: 'carts#check_password'
  get 'check', to: 'carts#check'

  root 'sessions#welcome'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
