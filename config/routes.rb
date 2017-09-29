Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "messages#index"
  namespace :api, defaults: {format: 'json'} do
  	resource :static_response, only:[] do
  		get :home
  	end
  end
	resources :messages, only: [:index]
end
