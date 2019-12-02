class CreateTrnProdPlanMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :trn_prod_plan_masters do |t|
      	t.string :trt_code, :null => false 
      	t.string :plant, :limit => 4, :null => false
		t.string :work_center, :limit => 10, :null => false
		t.integer :re_order_per
		t.integer :no_of_hrs
		t.string :sfg_code, :limit => 16, :null => false
		t.string :sfg_desc, :limit => 50, :null => false
		t.integer :day_req_batch
		t.integer :kanban_size
		t.integer :day_req_kanban
		t.integer :frequency_day
		t.integer :lot_size
		t.integer :safety_stock
		t.integer :max_stock
		t.integer :re_order_point
		t.string :uom, :limit => 3
		t.string :action_status, :default => 'open'
      	t.timestamps
    end
  end
end
