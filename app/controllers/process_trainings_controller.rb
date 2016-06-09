class ProcessTrainingsController < ApplicationController
  before_action :set_process_training, only: [:show, :edit, :update, :destroy]

  # GET /process_trainings
  # GET /process_trainings.json
  def index
    @process_trainings = ProcessTraining.all
  end

  # GET /process_trainings/1
  # GET /process_trainings/1.json
  def show
  end

  # GET /process_trainings/new
  def new
    @process_training = ProcessTraining.new
  end

  # GET /process_trainings/1/edit
  def edit
  end

  # POST /process_trainings
  # POST /process_trainings.json
  def create
    @process_training = ProcessTraining.new(process_training_params)

    respond_to do |format|
      if @process_training.save
        format.html { redirect_to @process_training, notice: 'Process training was successfully created.' }
        format.json { render :show, status: :created, location: @process_training }
      else
        format.html { render :new }
        format.json { render json: @process_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /process_trainings/1
  # PATCH/PUT /process_trainings/1.json
  def update
    respond_to do |format|
      if @process_training.update(process_training_params)
        format.html { redirect_to @process_training, notice: 'Process training was successfully updated.' }
        format.json { render :show, status: :ok, location: @process_training }
      else
        format.html { render :edit }
        format.json { render json: @process_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_trainings/1
  # DELETE /process_trainings/1.json
  def destroy
    @process_training.destroy
    respond_to do |format|
      format.html { redirect_to process_trainings_url, notice: 'Process training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process_training
      @process_training = ProcessTraining.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def process_training_params
      params.fetch(:process_training, {})
    end
end
