class EdutypesController < ApplicationController
  before_action :set_edutype, only: [:show, :edit, :update, :destroy]

  # GET /edutypes
  # GET /edutypes.json
  def index
    @edutypes = Edutype.all
  end

  # GET /edutypes/1
  # GET /edutypes/1.json
  def show
  end

  # GET /edutypes/new
  def new
    @edutype = Edutype.new
  end

  # GET /edutypes/1/edit
  def edit
  end

  # POST /edutypes
  # POST /edutypes.json
  def create
    @edutype = Edutype.new(edutype_params)

    respond_to do |format|
      if @edutype.save
        format.html { redirect_to @edutype, notice: 'Edutype was successfully created.' }
        format.json { render :show, status: :created, location: @edutype }
      else
        format.html { render :new }
        format.json { render json: @edutype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edutypes/1
  # PATCH/PUT /edutypes/1.json
  def update
    respond_to do |format|
      if @edutype.update(edutype_params)
        format.html { redirect_to @edutype, notice: 'Edutype was successfully updated.' }
        format.json { render :show, status: :ok, location: @edutype }
      else
        format.html { render :edit }
        format.json { render json: @edutype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edutypes/1
  # DELETE /edutypes/1.json
  def destroy
    @edutype.destroy
    respond_to do |format|
      format.html { redirect_to edutypes_url, notice: 'Edutype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edutype
      @edutype = Edutype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edutype_params
      params.require(:edutype).permit(:name)
    end
end
