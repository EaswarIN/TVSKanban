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

	def trt_list
	    @trt = TrtMst.select("trt_msts.trt_code, m.id, m.mat_code, m.mat_desc, m.mat_type ")
	    .joins("INNER JOIN mst_materials m ON trt_msts.sfg_code = m.mat_code")
		.joins("LEFT JOIN trn_prod_plan_masters p ON p.sfg_desc = m.mat_desc")
		.where(["trt_msts.sfg_desc = m.mat_desc and m.mat_uom = ? and p.sfg_desc is null", "M"])

		respond_to do |format| 
	        format.html  
	        format.json { render json: @trt.to_json }  
	    end  
	end 
end
