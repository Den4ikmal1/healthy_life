class RationsController < ApplicationController

  before_action :find_ration, only: [:show, :destroy, :edit, :update]

  def new 
    @ration = Ration.new
  end 

  def show
    @morning = find_product(@ration.morning.compact)
    @afternoon = find_product(@ration.afternoon.compact)
    @lunch = find_product(@ration.lunch.compact)
    @evening = find_product(@ration.evening.compact)
    @new_ration = find_product(@ration.new_ration.compact)
  end

  def etit
  end

  def update
    @morning = params[:morning][:product_ids]
    @afternoon = params[:afternoon][:product_ids]
    @lunch = params[:lunch][:product_ids]
    @evening = params[:evening][:product_ids]
    if params[:new_ration].blank?
      @new_ration = []
    else
      @new_ration = params[:new_ration][:product_ids]
    end
    @ration.update(rations_params.merge(morning: @morning, afternoon: @afternoon, lunch: @lunch, evening: @evening, new_ration: @new_ration))
      if @ration.save
      redirect_to @ration
    else
      render :edit
    end
  end

  def create
    @morning = params[:morning][:product_ids]
    @afternoon = params[:afternoon][:product_ids]
    @lunch = params[:lunch][:product_ids]
    @evening = params[:evening][:product_ids]
    if params[:new_ration].blank?
      @new_ration = []
    else
      @new_ration = params[:new_ration][:product_ids]
    end
    @ration = Ration.new(rations_params.merge(morning: @morning, afternoon: @afternoon, lunch: @lunch, evening: @evening, new_ration: @new_ration  ))
    if @ration.save
      redirect_to @ration
    else
      render :new
    end
  end
  def index
    @rations = Ration.all.paginate(page: params[:page], per_page: 5)
  end
  def destroy
    @ration.destroy
    redirect_to rations_path
  end

  def add_to
    render layout: false
  end
  def delete
    
  end

  private

    def rations_params
      params.require(:ration).permit(:name, :description)
    end


    def find_ration
      @ration = Ration.find(params[:id])
    end

    def find_product(product_id)
      Product.where(id: product_id).to_a
    end
end
