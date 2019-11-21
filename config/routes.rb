Rails.application.routes.draw do 
	get 'home/index'
	
	resources :prod_plan_headers
	resources :trn_prod_plan_headers
	resources :prod_plan_masters  
	resources :trn_prod_plan_masters

	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 

	get '/trt_masters/:partid', to: 'trt#get_trt_by_part', as: 'trt_masters/'
	get '/material', to: 'material#material_list', as: 'material/' 
	get '/trt_list', to: 'trt#trt_list', as: 'trt_list/' 
end 