class CreateTrtMsts < ActiveRecord::Migration[6.0]
  def change
    create_table :trt_msts do |t|
        t.string :trt_code, :limit => 40
        t.string :part_no, :limit => 10
        t.string :sfg_code, :limit => 40
        t.string :sfg_desc, :limit => 40
        t.string :fabric_code, :limit => 40
        t.string :fabric_desc, :limit => 40
        t.string :comp_code, :limit => 40
        t.string :comp_desc, :limit => 40
        t.string :vendor_code, :limit => 10
        t.string :vendor_name, :limit => 50
        t.integer :bom_no
        t.string :trt_identification, :limit => 30
        t.string :trt_status, :limit => 1
        t.string :user_id, :limit => 7
        t.string :device_id, :limit => 20
        t.string :status, :limit => 1 
        t.timestamps
    end
  end
end 
