class CoachesController < ApplicationController
  
  before_action :set_coach, only: [:show]
  
  def show
  # @parametrs = @user.personal_characteristics.buil
  end

  private

    def set_coach
      @coach = Coach.find(params[:id])
    end
   
   

end