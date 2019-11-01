class CreateProdPlanHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :prod_plan_headers do |t|
      	t.string :plant, :limit => 4, :null => false
		t.string :work_center, :limit => 10, :null => false
		t.string :sfg_code, :limit => 40, :null => false
		t.string :sfg_desc, :limit => 40, :null => false
		t.string :sfg_uom, :limit => 3, :null => false
		t.string :trt_code, :limit => 40, :null => false
		t.decimal :day_req_qty_m2, :precision => 12, :scale => 3
		t.decimal :re_order_point, :precision => 12, :scale => 3
		t.decimal :max_stock, :precision => 12, :scale => 3
		t.decimal :safety_stock, :precision => 12, :scale => 3
		t.decimal :stock_qty, :precision => 12, :scale => 3
		t.decimal :sfg_plan_qty, :precision => 12, :scale => 3
		t.string :sfg_sequence, :limit => 3
		t.string :bom_type, :limit => 10
		t.string :po_type, :limit => 10
		t.string :schedule_no, :limit => 10, :null => false
		t.string :schedule_status, :limit => 10, :null => false
		t.string :action_status,default: 'open'
		t.timestamps
    end
  end
end

: