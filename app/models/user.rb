class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  belongs_to :group
  has_many :personal_characteristics
  belongs_to :ration
  belongs_to :training



  def self.weight(user)
    lol, date = [], []
    u = User.where(id: user.id).first
    p = PersonalCharacteristic.where(user_id: u.id).to_a
    p.map do |personal|
      lol << personal.weight_index['value'].to_f
      date << personal.rufe_index['date']
    end
    unless lol.empty?
    date_time = date.first
    a = lol.first
    d = lol.simple_moving_average
    g =  (d - a) / d *100
    e =  (a - d) / d *100
    if u.ration 
      if a > d
         
          return  "При данной программе питания #{u.ration.name} наблюдается уменьшение ИМТ у #{u.first_name}, в среднем на #{e.round(2)} % ", date_time, d, a  
        else 
          return "При данной программе питания #{u.ration.name}  наблюдается увеличения ИМТ у #{u.first_name}, в среднем  на #{g.round(2)} % ", date_time, d, a
        end
        else
          "Нет рацион"
        end

    else
     "Нет данных" 
    end
    
  end
    def self.test(user)
    lol, date = [], []
    u = User.where(id: user.id).first
    p = PersonalCharacteristic.where(user_id: u.id).to_a
    p.map do |personal|
      lol << personal.rufe_index['value'].to_f
     date << personal.rufe_index['date']
    end
    unless lol.empty?
      date_time = date.first
      a = lol.first
    
      d = lol.simple_moving_average
      g =  (d - a) / d *100
      e =  (a - d) / d *100
      if u.training
        if a > d 
          
            return  "Данная программа #{u.training.name} подходит для тренировочного процесса, т.к индекс Руфье в среднем уменьшился на #{e.round(2)} % ",date_time, d, a  
          else 
            return "Данная программа #{u.training.name} не подходит для тренировочного процесса, т.к индекс Руфье в среднем увеличился на #{g.round(2)} % ", date_time, d, a 
          end
          else 
            "Нет тренировки"
          end
        
    else 
      "Нет данных" 
    end
  end


end
