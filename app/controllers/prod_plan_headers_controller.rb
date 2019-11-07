class ProdPlanHeadersController < ApplicationController
  before_action :set_prod_plan_header, only: [:show, :edit, :update, :destroy]


  # GET /prod_plan_headers
  # GET /prod_plan_headers.json
  def index
    @prod_plan_header = ProdPlanHeader.new
    @prod_plan_headers_list = ProdPlanHeader.all

    # @prod_plan_masters_list = ProdPlanMaster.all

    @prod_plan_masters_list = ProdPlanMaster.all.joins("LEFT JOIN prod_plan_headers ON prod_plan_masters.sfg_desc = prod_plan_headers.sfg_desc")
    .where(["prod_plan_headers.sfg_desc is null"] )

    @trt_mst = TrtMst.select(:id, :trt_code, :sfg_code, :vendor_name,:fabric_code, :comp_code, :gauge).order('vendor_code, fabric_code, comp_code, gauge')
  end

  # GET /prod_plan_headers/1
  # GET /prod_plan_headers/1.json
  def show
  end

  # GET /prod_plan_headers/new
  def new
    @prod_plan_header = ProdPlanHeader.new
  end

  # GET /prod_plan_headers/1/edit
  def edit
  end

  # POST /prod_plan_headers
  # POST /prod_plan_headers.json
  def create 
    prod_plan_header_params["schedule"].each do |k, r| 
      ProdPlanHeader.create(plant: prod_plan_header_params["plant"], work_center: prod_plan_header_params["work_center"], sfg_uom: prod_plan_header_params["sfg_uom"], sfg_desc: r["sfg_desc"], sfg_code: r["sfg_code"], trt_code: r["trt_code"]  , day_req_qty_m2: r["day_req_qty_m2"], stock_qty: r["stock_qty"], sfg_plan_qty: r["sfg_plan_qty"], sfg_sequence: r["sfg_sequence"], bom_type: r["bom_type"], schedule_no: r["schedule_no"], schedule_status: r["schedule_status"], safety_stock: r["safety_stock"], max_stock: r["max_stock"], reorder_point: r["reorder_point"], action_status: r["action_status"], po_type: r["po_type"])
    end

    respond_to do |format|
      format.html { redirect_to prod_plan_headers_url, notice: 'Prod plan header was successfully created.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /prod_plan_headers/1
  # PATCH/PUT /prod_plan_headers/1.json
  def update
    respond_to do |format|
      if @prod_plan_header.update(prod_plan_header_params)
        format.html { redirect_to @prod_plan_header, notice: 'Prod plan header was successfully updated.' }
        format.json { render :show, status: :ok, location: @prod_plan_header }
      else
        format.html { render :edit }
        format.json { render json: @prod_plan_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prod_plan_headers/1
  # DELETE /prod_plan_headers/1.json
  def destroy
    @prod_plan_header.destroy
    respond_to do |format|
      format.html { redirect_to prod_plan_headers_url, notice: 'Prod plan header was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prod_plan_header
      @prod_plan_header = ProdPlanHeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prod_plan_header_params
      # params.fetch(:prod_plan_header, {})
      params.require(:prod_plan_header).permit(:plant, :work_center, :sfg_uom, schedule: [:sfg_desc, :sfg_code, :trt_code, :day_req_qty_m2, :stock_qty, :sfg_plan_qty, :sfg_sequence, :bom_type, :schedule_no, :schedule_status, :safety_stock, :max_stock, :reorder_point, :action_status, :po_type])
      # params.require(:prod_plan_header).permit(:plant, :work_center, :sfg_uom, sfg_desc, :trt_code, :day_req_qty_m2, :stock_qty, :sfg_plan_qty, :sfg_sequence, :bom_type, :schedule_no, :schedule_status, :safety_stock, :max_stock, :re_order_point, :action_status, :po_type, :sfg_code:  [])

    end
end
