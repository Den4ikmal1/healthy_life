class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    @user = user
      if user
        if user.type == "Coach"  
           coach_abilities
        else
         user_abilities
        end
      else
        guest_abilities
      end
  end

  def guest_abilities
    can :read, :all, except: [Ration, Training, Group, Schedule]
  end

  def coach_abilities
    can :manage, :all
  end

   def user_abilities
     guest_abilities
     can :create, [PersonalCharacteristic]
     
  end

end