Forum::Application.routes.draw do
  
  root :to => 'users#show'
  
  resource :users
end
