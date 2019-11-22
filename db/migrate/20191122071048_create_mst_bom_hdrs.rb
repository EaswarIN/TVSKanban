class CreateMstBomHdrs < ActiveRecord::Migration[6.0]
  def change
    create_table :mst_bom_hdrs do |t|
      	t.string :plant, :limit => 4, :null => false
		t.string :work_center, :limit => 10, :null => false
		t.string :sfg_code, :limit => 40, :null => false
		t.string :sfg_desc, :limit => 40, :null => false
		t.string :sfg_uom, :limit => 3, :null => false 
		t.string :bom_type, :limit => 10  
        t.integer :base_qty
        t.string :alt_bom_no
		t.timestamps
    end
  end
end
