Rails.application.routes.draw do
   root to: 'tasks#index'
   resources :tasks
   
   
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
   
   
     get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
<<<<<<< HEAD

 resources :tasks,  only: [:create, :destroy,:edit,:update, :show,:new]


=======
  resources :task_posts,  only: [:create, :destroy,:edit,:update, :show]
>>>>>>> abb0becc9320e6fc48d3f2ea359f022dbdbc7ff4

end
