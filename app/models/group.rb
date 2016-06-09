class Group < ActiveRecord::Base
  has_many :users
  belongs_to :coach
  has_many :schedules

  validates :title, :data_start, :data_finish, :days, presence: true

  RUFE_INDEX = ["Хорошо", "Нормально", "Удовлетворительно", "Плохо"]
  WEIGHT_INDEX = ["Анорексия", "Дефицит_массы_тела", "Норма", "Избыток_массы_тела",  "Первая_стадия_ожирения", "Вторая_стадия_ожирения", "Третья_стадия_ожирения" ]
  DAYS = ["Понедельник, Среда, Пятница", "Вторник, Четверг, Суббота", "Понедельник, Четверг, Суббота", "Вторник, Четверг, Суббота"]
 
end