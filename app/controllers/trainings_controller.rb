class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Training.all.paginate(page: params[:page], per_page: 3)
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @exercise = Exercise.all.map{ |c| [c.name, c.id]}
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @exercise = Exercise.all.map{ |c| [c.name, c.id]}
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'Training was successfully created.' }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to
    render layout: false
    
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: 'Training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.require(:training).permit(:name, :number, :notice).tap do |whitelisted|
        whitelisted[:exercise_param] = params[:training][:exercise_param]
        whitelisted[:exercise_param_f] = params[:training][:exercise_param_f]
        whitelisted[:exercise_param_s] = params[:training][:exercise_param_s]
        whitelisted[:exercise_param_t] = params[:training][:exercise_param_t]
        whitelisted[:exercise_param_fr] = params[:training][:exercise_param_fr]
        whitelisted[:exercise_param_fv] = params[:training][:exercise_param_fv]
        whitelisted[:exercise_param_sx] = params[:training][:exercise_param_sx]
        whitelisted[:exercise_param_sv] = params[:training][:exercise_param_sv]
      end
    end
end
