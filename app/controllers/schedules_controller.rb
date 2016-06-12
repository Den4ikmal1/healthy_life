class SchedulesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  def new
    @group = Group.find(params[:group_id])
    @schedule = Schedule.new
  end

  def create
    @group = Group.find(params[:group_id])
    @schedule = @group.schedules.create(schedule_params.merge(group: @group))
    redirect_to group_schedules_path
  end

  def index
    @group = Group.find(params[:group_id])
    @schedules = Schedule.all 
    @b = user_schedules(@schedules)
    @a = all_users(@b)

  end

  private

    def schedule_params
      params.require(:schedule).permit(:date_employment, :group_id, user_ids: [])
    end

    def user_schedules(schedules)
      b = []
        tests  = schedules.map do |a|
        b << a.user_ids
      end 
      b
    end

    def all_users(users_ids)
      users_ids.flatten
    end
end
