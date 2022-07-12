Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #authors
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  get '/authors/:id', to: 'authors#show'
  #author_books
  get '/authors/:author_id/books', to: 'author_books#index'
  get '/authors/:author_id/books/new', to: 'author_books#new'
  post '/authors/:author_id/books', to: 'author_books#create'
  #books
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
end
