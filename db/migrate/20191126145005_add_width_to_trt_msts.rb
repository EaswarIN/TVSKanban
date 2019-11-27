class AddWidthToTrtMsts < ActiveRecord::Migration[6.0]
  def change
    add_column :trt_msts, :width, :decimal, precision: 3, scale: 2
    TrtMst.update_all(:width => 1.4)
  end
end
