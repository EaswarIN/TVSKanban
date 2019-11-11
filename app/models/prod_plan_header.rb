class ProdPlanHeader < ApplicationRecord
	def self.update_sequence
		
     # ProdPlanHeader.all.joins("JOIN trt_msts as t ON prod_plan_headers.trt_code = t.trt_code")
     # .order('t.vendor_code, t.fabric_code, t.comp_code, t.gauge')
     # .update_all('schedule_no = t.id')
     ProdPlanHeader.find_by_sql "UPDATE prod_plan_headers SET sfg_sequence = trt_msts.row_number FROM (SELECT trt_msts.trt_code, ROW_NUMBER () OVER (ORDER BY vendor_code, fabric_code, comp_code, gauge) FROM trt_msts JOIN prod_plan_headers ON prod_plan_headers.trt_code = trt_msts.trt_code WHERE prod_plan_headers.trt_code = trt_msts.trt_code) trt_msts WHERE prod_plan_headers.trt_code = trt_msts.trt_code"
 	end
end
