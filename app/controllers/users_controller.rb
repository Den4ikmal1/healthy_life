class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    @test = @user.personal_characteristics
    @c = []
    @test.each { |k,v| @c << k.weight_index}
    @groups = Group.find_each.map{ |c| [c.title, c.id]}
  end

  def edit
    @groups = Group.find_each.map{ |c| [c.title, c.id]}

  end
  def update
    @groups = Group.find_each.map{ |c| [c.title, c.id]}
    @user.update(group_id: params[:group_id])
    redirect_to @user
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
    
   
   

end