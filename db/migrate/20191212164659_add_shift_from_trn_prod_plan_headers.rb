class AddShiftFromTrnProdPlanHeaders < ActiveRecord::Migration[6.0]
  def change
    add_column :trn_prod_plan_headers, :shift, :integer
  end
end
