class CreateTrnPlannedOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :trn_planned_orders do |t|
      	t.string :plant, :limit => 4, :null => false
		t.string :plan_order_no, :limit => 10, :null => false
		t.date :plan_order_dt
		t.string :work_center, :limit => 10, :null => false
		t.string :sfg_code, :limit => 40, :null => false
		t.string :sfg_desc, :limit => 40, :null => false
		t.string :sfg_uom, :limit => 3, :null => false 
		t.integer :sfg_qty 
        t.string :alt_bom_no
		t.timestamps
    end
  end
end
 