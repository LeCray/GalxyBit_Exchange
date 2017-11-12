Rails.application.routes.draw do

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'	


	root to: 'pages#index'

	get '/about' => 'pages#about'
	
	resources :admin

	resources :clients do
		resources :accounts
		get '/zar_transactions' => 'zar_transactions#new'
		get '/btc_transactions' => 'btc_transactions#new'
		get '/ltc_transactions' => 'ltc_transactions#new'
		get '/eth_transactions' => 'eth_transactions#new'
		
	end
	post '/zar_transactions' => 'zar_transactions#create'

	resources :account_activations, only: [:edit]


	get '/signup' => 'clients#new'
	post '/clients' => 'clients#create'

	namespace :api do
		namespace :v1 do
			post 'admin/change_status', to: 'admin#change_status'

			post 'accounts/new_transaction', to: 'accounts#new_transaction'
			post 'accounts/cancel_transaction', to: 'accounts#cancel_transaction'

			post 'bitcoin/new_btc_transaction', to: 'bitcoin#new_btc_transaction'
			post 'bitcoin/cancel_btc_transaction', to: 'bitcoin#cancel_btc_transaction'
		end
	end


	root 'currencies#show', id: 'bitcoin'

	resources :currencies, only: [:show]
	
	get '/currencies' => 'currencies#show'

	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
