class GroupsController < ApplicationController

  before_action :coaches_load, only: [:new, :create]
  before_action :find_group, only: [:show, :destroy]

  def new 
    @group = Group.new
  end 

  def show
  end

  def create
    @group = Group.new(groups_params)
    @group.coach_id = params[:coach_id]
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end
  def index
    @groups = Group.all
  end
  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

    def groups_params
      params.require(:group).permit(:title, :coach_id, :data_start, :data_finish, :days)
    end

    def coaches_load
      coaches = User.where(type: "Coach")
      @coaches = coaches.find_each.map{ |c| [c.email, c.id]} 
    end

    def find_group
      @group = Group.find(params[:id])
    end


end
