Rails.application.routes.draw do 
	get 'home/index'
	resources :prod_plan_headers
	resources :prod_plan_masters 
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 

	get '/trt_masters/', to: 'trt#get_all_trt', as: 'trt_masters/'
end 