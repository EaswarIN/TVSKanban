class MaterialController < ApplicationController
 
	def material_list
    @mst_material = MstMaterial.select("mst_materials.id, mst_materials.mat_code, mst_materials.mat_desc, mst_materials.mat_type")
    .joins("LEFT JOIN prod_plan_masters ON prod_plan_masters.sfg_desc = mst_materials.mat_desc")
    .where(["mst_materials.mat_uom = ? and prod_plan_masters.sfg_desc is null", "M2"] )
		respond_to do |format| 
	        format.html  
	        format.json { render json: @mst_material.to_json }  
	    end  
	end 
end
 