# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_26_145005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mst_bom_hdrs", force: :cascade do |t|
    t.string "plant", limit: 4, null: false
    t.string "work_center", limit: 10, null: false
    t.string "sfg_code", limit: 40, null: false
    t.string "sfg_desc", limit: 40, null: false
    t.string "sfg_uom", limit: 3, null: false
    t.string "bom_type", limit: 10
    t.integer "base_qty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "alt_bom_no"
  end

  create_table "mst_materials", force: :cascade do |t|
    t.string "mat_type", limit: 40
    t.string "mat_group", limit: 40
    t.string "mat_code", limit: 40
    t.string "mat_desc", limit: 40
    t.string "mat_uom", limit: 5
    t.string "plant", limit: 10
    t.string "str_loc", limit: 40
    t.string "prod_str_loc", limit: 40
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mst_plants", force: :cascade do |t|
    t.string "plant", limit: 4, null: false
    t.string "plant_name", limit: 30, null: false
    t.string "status", limit: 1, default: "A"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prod_plan_headers", force: :cascade do |t|
    t.string "plant", limit: 4, null: false
    t.string "work_center", limit: 10, null: false
    t.string "sfg_code", limit: 40, null: false
    t.string "sfg_desc", limit: 40, null: false
    t.string "sfg_uom", limit: 3, null: false
    t.string "trt_code", limit: 40, null: false
    t.decimal "day_req_qty_m2", precision: 12, scale: 3
    t.decimal "re_order_point", precision: 12, scale: 3
    t.decimal "max_stock", precision: 12, scale: 3
    t.decimal "safety_stock", precision: 12, scale: 3
    t.decimal "stock_qty", precision: 12, scale: 3
    t.decimal "sfg_plan_qty", precision: 12, scale: 3
    t.string "sfg_sequence", limit: 3
    t.string "bom_type", limit: 10
    t.string "po_type", limit: 10
    t.string "schedule_no", limit: 10, null: false
    t.string "schedule_status", limit: 10, null: false
    t.string "action_status", default: "open"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "part_no"
  end

  create_table "prod_plan_masters", force: :cascade do |t|
    t.string "plant", limit: 4, null: false
    t.string "work_center", limit: 10, null: false
    t.integer "re_order_per"
    t.integer "no_of_hrs"
    t.string "sfg_code", null: false
    t.string "sfg_desc", limit: 50, null: false
    t.integer "day_req_batch"
    t.integer "kanban_size"
    t.integer "day_req_kanban"
    t.integer "frequency_day"
    t.integer "lot_size"
    t.integer "safety_stock"
    t.integer "max_stock"
    t.integer "re_order_point"
    t.string "uom", limit: 3
    t.string "action_status", default: "open"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "part_no"
  end

  create_table "trn_planned_orders", force: :cascade do |t|
    t.string "plant", limit: 4, null: false
    t.string "plan_order_no", limit: 10, null: false
    t.date "plan_order_dt"
    t.string "work_center", limit: 10, null: false
    t.string "sfg_code", limit: 40, null: false
    t.string "sfg_desc", limit: 40, null: false
    t.string "sfg_uom", limit: 3, null: false
    t.integer "sfg_qty"
    t.string "alt_bom_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trn_prod_plan_headers", force: :cascade do |t|
    t.string "plant", limit: 4, null: false
    t.string "plan_order_no", limit: 30
    t.string "work_center", limit: 10, null: false
    t.string "sfg_code", limit: 40, null: false
    t.string "sfg_desc", limit: 40, null: false
    t.string "sfg_uom", limit: 3, null: false
    t.string "trt_code", limit: 40, null: false
    t.decimal "day_req_qty_m2", precision: 12, scale: 3
    t.decimal "re_order_point", precision: 12, scale: 3
    t.decimal "max_stock", precision: 12, scale: 3
    t.decimal "safety_stock", precision: 12, scale: 3
    t.decimal "stock_qty", precision: 12, scale: 3
    t.decimal "sfg_plan_qty", precision: 12, scale: 3
    t.string "sfg_sequence", limit: 3
    t.string "bom_type", limit: 10
    t.string "po_type", limit: 10
    t.string "schedule_no", limit: 10, null: false
    t.string "schedule_status", limit: 10, null: false
    t.string "action_status", default: "open"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sap_plan_order"
    t.string "alt_bom_no"
    t.date "plan_order_dt"
  end

  create_table "trn_prod_plan_masters", force: :cascade do |t|
    t.string "trt_code", null: false
    t.decimal "trt_width", precision: 7, scale: 2
    t.string "plant", limit: 4, null: false
    t.string "work_center", limit: 10, null: false
    t.integer "re_order_per"
    t.integer "no_of_hrs"
    t.string "sfg_code", limit: 16, null: false
    t.string "sfg_desc", limit: 50, null: false
    t.integer "day_req_batch"
    t.integer "kanban_size"
    t.integer "day_req_kanban"
    t.integer "frequency_day"
    t.integer "lot_size"
    t.integer "safety_stock"
    t.integer "max_stock"
    t.integer "re_order_point"
    t.string "uom", limit: 3
    t.string "action_status", default: "open"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trn_sfg_stocks", force: :cascade do |t|
    t.string "plant", limit: 4
    t.string "str_loc", limit: 4
    t.string "sfg_group", limit: 10
    t.string "trt_code", limit: 40
    t.string "sfg_code", limit: 16
    t.string "sfg_desc", limit: 50
    t.string "sfg_uom", limit: 3
    t.decimal "stock_qty", precision: 12, scale: 3
    t.decimal "stock_qty_kg", precision: 12, scale: 3
    t.string "lot_no", limit: 15
    t.string "rfid_tag", limit: 30
    t.date "expiry_dt"
    t.string "stock_status", limit: 10
    t.string "sap_batch", limit: 10
    t.string "sap_docref", limit: 10
    t.string "sap_status", limit: 1
    t.string "sap_err_msg", limit: 50
    t.datetime "sap_trn_dttime"
    t.datetime "sap_upd_dttime"
    t.string "insp_lot_no", limit: 10
    t.string "issue_status", limit: 20
    t.string "sup_roll_ref", limit: 20
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trn_sfg_stocks_on_user_id"
  end

  create_table "trt_msts", force: :cascade do |t|
    t.string "trt_code", limit: 40
    t.string "part_no", limit: 10
    t.string "sfg_code", limit: 40
    t.string "sfg_desc", limit: 40
    t.string "fabric_code", limit: 40
    t.string "fabric_desc", limit: 40
    t.string "comp_code", limit: 40
    t.string "comp_desc", limit: 40
    t.string "vendor_code", limit: 10
    t.string "vendor_name", limit: 50
    t.integer "bom_no"
    t.string "trt_identification", limit: 30
    t.string "trt_status", limit: 1
    t.string "user_id", limit: 7
    t.string "device_id", limit: 20
    t.string "status", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "gauge", precision: 3, scale: 2
    t.decimal "width", precision: 3, scale: 2
  end

end
