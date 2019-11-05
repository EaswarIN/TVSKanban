class ProdPlanMastersController < ApplicationController
  before_action :set_prod_plan_master, only: [:show, :edit, :update, :destroy] 

  # GET /prod_plan_masters
  # GET /prod_plan_masters.json
  def index
    @prod_plan_master = ProdPlanMaster.new
    @prod_plan_masters_list = ProdPlanMaster.select(:id, :sfg_desc, :sfg_code, :day_req_batch, :kanban_size, :frequency_day, :day_req_kanban, :lot_size, :safety_stock, :max_stock, :re_order_point, :action_status).order(:id)
    @trt_mst = MstMaterial.select(:id, :mat_code, :mat_desc, :mat_type).where({ mat_uom: "M2" })
  end

  # GET /prod_plan_masters/1
  # GET /prod_plan_masters/1.json
  def show
  end

  # GET /prod_plan_masters/new
  def new 
  end

  # GET /prod_plan_masters/1/edit
  def edit
  end

  # POST /prod_plan_masters
  # POST /prod_plan_masters.json
  def create 
    @prod_plan_master = ProdPlanMaster.new(prod_plan_master_params) 
    respond_to do |format|
      if @prod_plan_master.save
        format.html { redirect_to prod_plan_masters_url, notice: 'Prod plan master was successfully created.' }
        format.json { render :index, status: :created, location: @prod_plan_master }
      else
        format.html { render :new }
        format.json { render json: @prod_plan_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prod_plan_masters/1
  # PATCH/PUT /prod_plan_masters/1.json
  def update 
    status = params[:action_status]
    status = status == 'Active'? 'In-Active': 'Active' 
 
    @prod_plan_master.update_column(:action_status, status)

    respond_to do |format| 
        format.html { redirect_to prod_plan_masters_url, notice: 'Prod plan master was successfully updated.' }
        format.json { render :index, status: :ok, location: @prod_plan_master } 
    end
  end

  # DELETE /prod_plan_masters/1
  # DELETE /prod_plan_masters/1.json
  def destroy
    @prod_plan_master.destroy
    respond_to do |format|
      format.html { redirect_to prod_plan_masters_url, notice: 'Prod plan master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prod_plan_master
      @prod_plan_master = ProdPlanMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prod_plan_master_params
     # params.fetch(:prod_plan_master, {})
      params.require(:prod_plan_master).permit(:plant, :work_center, :re_order_per, :no_of_hrs, :sfg_code, :sfg_desc, :day_req_batch, :kanban_size, :day_req_kanban, :frequency_day, :lot_size, :safety_stock, :max_stock, :re_order_point, :uom, :action_status)

    end
end
