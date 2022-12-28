class YakushokusController < ApplicationController
  before_action :set_yakushoku, only: %i[ show edit update destroy ]

  # GET /yakushokus or /yakushokus.json
  def index
    @yakushokus = Yakushoku.all
  end

  # GET /yakushokus/1 or /yakushokus/1.json
  def show
  end

  # GET /yakushokus/new
  def new
    @yakushoku = Yakushoku.new
  end

  # GET /yakushokus/1/edit
  def edit
  end

  # POST /yakushokus or /yakushokus.json
  def create
    @yakushoku = Yakushoku.new(yakushoku_params)

    respond_to do |format|
      if @yakushoku.save
        format.html { redirect_to yakushoku_url(@yakushoku), notice: "Yakushoku was successfully created." }
        format.json { render :show, status: :created, location: @yakushoku }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @yakushoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yakushokus/1 or /yakushokus/1.json
  def update
    respond_to do |format|
      if @yakushoku.update(yakushoku_params)
        format.html { redirect_to yakushoku_url(@yakushoku), notice: "Yakushoku was successfully updated." }
        format.json { render :show, status: :ok, location: @yakushoku }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @yakushoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yakushokus/1 or /yakushokus/1.json
  def destroy
    @yakushoku.destroy

    respond_to do |format|
      format.html { redirect_to yakushokus_url, notice: "Yakushoku was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yakushoku
      @yakushoku = Yakushoku.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def yakushoku_params
      params.require(:yakushoku).permit(:yaku_name)
    end
end
