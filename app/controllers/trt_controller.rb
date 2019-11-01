class TrtController < ApplicationController 

	# GET /prod_plan_headers/1
	# GET /prod_plan_headers/1.json
	def get_all_trt
    @trt_mst = TrtMst.all

		respond_to do |format| 
	        format.html  
	        format.json  
	      end
	    end
	end 
end
