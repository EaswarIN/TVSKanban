class CreateMstMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :mst_materials do |t|
        t.string :mat_type, :limit => 40
        t.string :mat_group, :limit => 40
        t.string :mat_code, :limit => 40
        t.string :mat_desc, :limit => 40
        t.string :mat_uom, :limit => 5
        t.string :plant, :limit => 10
        t.string :str_loc, :limit => 40
        t.string :prod_str_loc, :limit => 40

      t.timestamps
    end
  end
end
