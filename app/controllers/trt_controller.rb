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
    @trt = TrtMst.select("trt_msts.trt_code, mst_materials.id, mst_materials.mat_code, mst_materials.mat_desc, mst_materials.mat_type")
    .joins("INNER JOIN mst_materials ON trt_msts.sfg_code = mst_materials.mat_code")
	    .joins("LEFT JOIN trn_prod_plan_masters ON trn_prod_plan_masters.sfg_desc = mst_materials.mat_desc")
	    .where(["trt_msts.sfg_desc = mst_materials.mat_desc and mst_materials.mat_uom = ? and trn_prod_plan_masters.sfg_desc is null", "M2"] )
		
		respond_to do |format| 
	        format.html  
	        format.json { render json: @trt.to_json }  
	    end  
	end 
end
