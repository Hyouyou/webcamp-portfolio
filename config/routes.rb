Rails.application.routes.draw do

	devise_for :users, :controllers => {
		:registrations => 'users/registrations',
		:sessions => 'users/sessions',
		:omniauth_callbacks => 'users/omniauth_callbacks'
	}

	devise_scope :user do
		get "sign_in", :to => "users/sessions#new"
		get "sign_out", :to => "users/sessions#destroy"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'homes#top'
	get '/about' => 'homes#about'
	get '/posts' => 'posts#new'
	get '/res' => 'posts#new'

	resources :users, only:[:show, :edit, :update]
	resources :res, only:[:show, :create, :edit, :update, :destroy] do
		resource :re_comments, only:[:create, :destroy]
	end
	resources :posts, only:[:new, :show, :create, :edit, :update, :destroy] do
		resource :likes, only:[:create, :destroy]
		resources :comments, only:[:create, :destroy]
		collection do
		  get :search
		end
	end
end
