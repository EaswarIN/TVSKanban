class CreateTrnSfgStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :trn_sfg_stocks do |t|
    	t.string :plant,:limit=>4
		t.string :str_loc,:limit=>4
		t.string :sfg_group ,:limit=>10
		t.string :trt_code ,:limit=>40
		t.string :sfg_code,:limit=>16
		t.string :sfg_desc,:limit=>50
		t.string :sfg_uom,:limit=>3
		t.decimal :stock_qty, :precision => 12, :scale => 3
		t.decimal :stock_qty_kg, :precision => 12, :scale => 3
		t.string :lot_no,:limit=>15
		t.string :rfid_tag,:limit=>30
		t.date :expiry_dt	
		t.string :stock_status,:limit=>10
		t.string :sap_batch,:limit=>10
		t.string :sap_docref,:limit=>10
		t.string :sap_status,:limit=>1
		t.string :sap_err_msg,:limit=>50
		t.datetime :sap_trn_dttime 
		t.datetime :sap_upd_dttime
		t.string :insp_lot_no,:limit=>10
		t.string :issue_status,:limit=>20
		t.string :sup_roll_ref,:limit=>20
		t.references :user

      t.timestamps
    end
  end
end
