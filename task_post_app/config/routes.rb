Rails.application.routes.draw do
	get 'posts/index'
	get 'posts/new' => 'posts#new'
	get 'posts/:id' => 'posts#show'
	post 'posts/create' => 'posts.creates'

	get '/' => 'home#top'
	get '/about' => 'home#about'
end
