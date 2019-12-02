class TrnProdPlanHeadersController < ApplicationController
  before_action :set_prod_plan_header, only: [:show, :edit, :update, :destroy]


  # GET /prod_plan_headers
  # GET /prod_plan_headers.json
  def index
    @prod_plan_header = TrnProdPlanHeader.new
    @prod_plan_headers_list = TrnProdPlanHeader.select(:id, :trt_code, :lot_size, :sfg_code,:sfg_desc,:day_req_qty_m2, :re_order_point, :max_stock, :safety_stock, :stock_qty, :sfg_plan_qty, :sfg_sequence, :bom_type, :po_type, :schedule_no, :schedule_status,:alt_bom_no, :sap_plan_order).order(:sfg_sequence)

    # @prod_plan_masters_list = ProdPlanMaster.all

    @prod_plan_masters_list = TrnProdPlanMaster.select("trn_prod_plan_masters.*, o.plan_order_no as sap_plan_order, bh.alt_bom_no, bh.bom_type, ss.stock_qty,trt.width")
    .joins("LEFT JOIN trn_prod_plan_headers h ON trn_prod_plan_masters.trt_code = h.trt_code")
    .joins("LEFT JOIN trn_planned_orders o ON o.sfg_code = trn_prod_plan_masters.sfg_code and trn_prod_plan_masters.plant = o.plant and o.plan_order_dt = current_date")
    .joins("LEFT JOIN trn_sfg_stocks ss ON ss.trt_code = trn_prod_plan_masters.trt_code")
    .joins("LEFT JOIN trt_msts trt ON trt.trt_code = ss.trt_code")
    .joins("FULL OUTER JOIN mst_bom_hdrs bh ON o.sfg_code = bh.sfg_code and o.alt_bom_no = bh.alt_bom_no")
    .where(["h.sfg_code is null and trn_prod_plan_masters.action_status = ?", "Active"] )

    puts @prod_plan_masters_list.to_json

  end

  # GET /prod_plan_headers/1
  # GET /prod_plan_headers/1.json
  def show
  end

  # GET /prod_plan_headers/new
  def new
    @prod_plan_header = TrnProdPlanHeader.new
  end

  # GET /prod_plan_headers/1/edit
  def edit
  end

  # POST /prod_plan_headers
  # POST /prod_plan_headers.json
  def create 
    if !prod_plan_header_params["schedule"].blank? 
      num =  TrnProdPlanHeader.maximum(:id)
      if num.blank?
        num = 1
      end
      prod_plan_header_params["schedule"].each do |k, r| 
        TrnProdPlanHeader.create(plan_order_no: "MCH-#{num}", plan_order_dt: Date.today, plant: prod_plan_header_params["plant"], work_center: prod_plan_header_params["work_center"], sfg_uom: prod_plan_header_params["sfg_uom"], sfg_desc: r["sfg_desc"], sfg_code: r["sfg_code"], trt_code: r["trt_code"]  , day_req_qty_m2: r["day_req_qty_m2"], stock_qty: r["stock_qty"], sfg_plan_qty: r["sfg_plan_qty"], sfg_sequence: r["sfg_sequence"], bom_type: r["bom_type"], schedule_no: r["schedule_no"], schedule_status: r["schedule_status"], safety_stock: r["safety_stock"], max_stock: r["max_stock"], re_order_point: r["re_order_point"], action_status: r["action_status"], po_type: r["po_type"], sap_plan_order: r["sap_plan_order"], alt_bom_no: r["alt_bom_no"], lot_size: r["lot_size"])
        num = num + 1
      end

      respond_to do |format|
        # TrnProdPlanHeader.update_sequence
        format.html { redirect_to trn_prod_plan_headers_url, success: 'Prod plan header was successfully created.' }
        format.json { head :no_content }
      end
    end 
  end

  # PATCH/PUT /prod_plan_headers/1
  # PATCH/PUT /prod_plan_headers/1.json
  def update
    respond_to do |format|
      if @prod_plan_header.update(prod_plan_header_params)
        format.html { redirect_to @prod_plan_header, success: 'Prod plan header was successfully updated.' }
        format.json { render :show, status: :ok, location: @prod_plan_header }
      else
        format.html { render :edit }
        format.json { render json: @trn_prod_plan_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prod_plan_headers/1
  # DELETE /prod_plan_headers/1.json
  def destroy
    @prod_plan_header.destroy
    
    respond_to do |format|
      # TrnProdPlanHeader.update_sequence

      format.html { redirect_to trn_prod_plan_headers_url, success: 'Prod plan header was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prod_plan_header
      @prod_plan_header = TrnProdPlanHeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prod_plan_header_params
      # params.fetch(:prod_plan_header, {})
      params.require(:trn_prod_plan_header).permit(:plant, :work_center, :sfg_uom, :plan_order_dt, schedule: [:sfg_desc, :sfg_code, :trt_code, :day_req_qty_m2, :stock_qty, :sfg_plan_qty, :sfg_sequence, :bom_type, :schedule_no, :schedule_status, :safety_stock, :max_stock, :re_order_point, :action_status, :po_type, :plan_order_no, :sap_plan_order, :alt_bom_no, :lot_size])
      # params.require(:prod_plan_header).permit(:plant, :work_center, :sfg_uom, sfg_desc, :trt_code, :day_req_qty_m2, :stock_qty, :sfg_plan_qty, :sfg_sequence, :bom_type, :schedule_no, :schedule_status, :safety_stock, :max_stock, :re_order_point, :action_status, :po_type, :sfg_code:  [])

    end
end
