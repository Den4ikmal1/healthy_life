class PersonalCharacteristicsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  
  def new
    @personal_characteristic = PersonalCharacteristic.new
  end

  def create
    @params_rufe_index = params[:personal_characteristic][:rufe_index]
    @params_weight_index = params[:personal_characteristic][:weight_index]
    @personal_characteristics = @user.personal_characteristics.create(
      rufe_index: PersonalCharacteristic.index_rufe(@params_rufe_index),
      weight_index: PersonalCharacteristic.index_weight(@params_weight_index),
      activity_index: PersonalCharacteristic.index_activity(@params_weight_index))
    redirect_to @user
  end

  def show
  end

  private

    def set_user

      @user = User.find(params[:user_id])
      @user ||= Coach.find(params[:coach_id]) 
    end

    def set_personal_characteristic
      @personal_characteristic = PersonalCharacteristic.find(params[:id])
    end

    def personal_characteristic_params
      params.require(:personal_characteristic).permit(:age)
    end

end
