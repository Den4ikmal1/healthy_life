class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :chart, :statistics]
  before_action :load_personal_data, only: [:edit, :update]
  
  def show
    @ration = @user.ration
   
    @test = @user.personal_characteristics
    @groups = Group.all.map{ |c| [c.title, c.id]}
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "report",
               template: 'users/show.pdf.erb',
               layout: 'layouts/pdf.html.erb',
                :footer => {
                :content => render_to_string(:template => 'users/footer.pdf.erb')
            } 

      end
    end
  end

  def edit


  end

  def dasboards

   
  end

  def index 
    @users = User.all
  end



  def statistics
    
    
    @rufe = User.test(@user)
    @weight = User.weight(@user)
 
   
  end

  def chart

    @test = @user.personal_characteristics
    @c, @d, @b, @e, @m, @l, @lamd = [], [], [], [], [], [], []
    @test.each { |k,v| @c << k.weight_index}


    @test.each { |k,v| @d << k.rufe_index}

    @test.each { |k,v| @lamd << k.rufe_index['value'] }
    @b << User.test(@user).last(2) 
    @m << User.weight(@user).last(2)
    # assert, asera = { }, { }
    # assert['first'] = @lamd.first
    # assert['date'] = Time.now
    # asera['first'] = @lamd.last
    # asera['date'] = Time.now
    # @d << assert
    # @d << asera
    @tarantiono =  @d 
    
    s, d = { }, { }
    k, b = { }, { } 
    @k = @b.flatten
    s['first'] = @k.last unless @k.empty?
    d['second'] = @lamd.first unless @lamd.empty?
    s['date'] = Time.now 

    d['first'] = @k.first unless @k.empty?
    s['second'] = @lamd.last unless @lamd.empty?
    d['date'] = Time.now 
    @e = [s, d]
    @u = @m.flatten
    k['first'] = @u.last unless @u.empty?
    k['date'] = Time.now

    b['first'] = @u.first unless @u.empty?
    b['date'] = Time.now
    @l = [k, b]
    

         
   
     

 
    
  end
  def update
    @user.update!(group_id: params[:group_id], ration_id: params[:ration_id], training_id: params[:training_id])
    redirect_to @user
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
    
    def load_personal_data
      @groups = Group.find_each.map{ |c| [c.title, c.id]}
      @rations = Ration.find_each.map{ |c| [c.name, c.id]}
      @trainings = Training.find_each.map{ |c| [c.name, c.id]}
    end
   def calculate_index(params_index)
     
   end

end