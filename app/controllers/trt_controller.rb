class TrtController < ApplicationController 

	# GET /prod_plan_headers/1
	# GET /prod_plan_headers/1.json
	def get_trt_by_part
    @trt_mst = TrtMst.select(:id, :trt_code, :sfg_code, :vendor_name,:fabric_code, :comp_code, :gauge)
    .where({ sfg_code: params[:partid] }).order('vendor_code, fabric_code, comp_code, gauge')

	respond_to do |format| 
        format.html  
        format.json { render json: @trt_mst.to_json }  
      end  
	end 
end
