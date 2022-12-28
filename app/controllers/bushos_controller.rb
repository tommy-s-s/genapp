class BushosController < ApplicationController
  before_action :set_busho, only: %i[ show edit update destroy ]

  # GET /bushos or /bushos.json
  def index
    @bushos = Busho.all
  end

  # GET /bushos/1 or /bushos/1.json
  def show
  end

  # GET /bushos/new
  def new
    @busho = Busho.new
  end

  # GET /bushos/1/edit
  def edit
  end

  # POST /bushos or /bushos.json
  def create
    @busho = Busho.new(busho_params)

    respond_to do |format|
      if @busho.save
        format.html { redirect_to busho_url(@busho), notice: "Busho was successfully created." }
        format.json { render :show, status: :created, location: @busho }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @busho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bushos/1 or /bushos/1.json
  def update
    respond_to do |format|
      if @busho.update(busho_params)
        format.html { redirect_to busho_url(@busho), notice: "Busho was successfully updated." }
        format.json { render :show, status: :ok, location: @busho }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @busho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bushos/1 or /bushos/1.json
  def destroy
    @busho.destroy

    respond_to do |format|
      format.html { redirect_to bushos_url, notice: "Busho was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busho
      @busho = Busho.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def busho_params
      params.require(:busho).permit(:busho_name)
    end
end
