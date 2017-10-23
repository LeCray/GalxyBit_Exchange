Rails.application.routes.draw do

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'	


	root to: 'pages#index'

	get '/about' => 'pages#about'
	
	get '/admin' => "admin#index" 

	resources :clients do
		resources :accounts
		get '/zar_transactions' => 'zar_transactions#new'
		
	end
	post '/zar_transactions' => 'zar_transactions#create'

	resources :account_activations, only: [:edit]


	get '/signup' => 'clients#new'
	post '/clients' => 'clients#create'

	namespace :api do
		namespace :v1 do
			post 'accounts/new_transaction', to: 'accounts#new_transaction'
		end
	end


	root 'currencies#show', id: 'bitcoin'

	resources :currencies, only: [:show]
	
	get '/currencies' => 'currencies#show'

	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
