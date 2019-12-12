class RemoveScheduleNoFromTrnProdPlanHeaders < ActiveRecord::Migration[6.0]
  def change
  	remove_column :trn_prod_plan_headers, :schedule_no
  end
end
