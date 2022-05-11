class ManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manager, only: %i[ show edit update destroy ]

  # GET /managers or /managers.json
  def index
    @managers = Manager.all
    authorize @managers
  end

  # GET /managers/1 or /managers/1.json
  def show
    authorize @manager
  end

  # GET /managers/new
  def new
    @manager = Manager.new
    authorize @manager
  end

  # GET /managers/1/edit
  def edit
    authorize @manager
  end

  # POST /managers or /managers.json
  def create
    authorize Manager
    @manager = Manager.new(manager_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to manager_url(@manager), notice: "Manager was successfully created." }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managers/1 or /managers/1.json
  def update
    authorize @manager
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to manager_url(@manager), notice: "Manager was successfully updated." }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1 or /managers/1.json
  def destroy
    authorize @manager
    @manager.destroy

    respond_to do |format|
      format.html { redirect_to managers_url, notice: "Manager was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manager_params
      params.fetch(:manager, {})
    end
end
