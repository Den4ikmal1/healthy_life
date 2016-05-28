class PersonalCharacteristic < ActiveRecord::Base
  belongs_to :user
  belongs_to :coach
  
  ACTIVITY_TYPES = ["Низкая_активность", "Небольшая_активность", "Средне_статистическа_активность", "Высокая_активность"]
 
  def self.index_rufe(params_rufe)
    parametr_rufe = (4 * (parse_params(params_rufe).reduce :+ ) - 200)/10
    { "value": parametr_rufe.round(2), "name": interpretation_index_rufe(parametr_rufe) }
  end

  def self.index_weight(params_weight)
    index = parse_params(params_weight)
    parametr_weight = index[0] / ((index[1] / 100) ** 2)
    { "value": parametr_weight.round(2), "name": interpretation_index_weight(parametr_weight), "date": Time.zone.now }
  end

  def self.index_activity(params_weight)
    index = parse_params(params_weight)
    params_matabolism = 655 + (9.6 * index[0]) + ( 1.8 * (index[1] / 100)) - (4.7 * index[2])
    interpretation_index_activity(params_weight[:activity].to_s) * params_matabolism.round
  end

  def self.interpretation_index_rufe(parametr_rufe)
    find_status(get_status_rufe, parametr_rufe)
  end

  def self.interpretation_index_weight(parametr_weight)
    find_status(get_status_weight, parametr_weight)
  end

   def self.interpretation_index_activity(parametr_weight)
    find_status(get_status_activity, parametr_weight)
  end  

  def self.get_status_rufe
    status = {
      0..5                   => "Хорошо",
      5.1..10                => "Нормально",
      10..15                 => "Удовлетворительно",
      15.1..Float::INFINITY  => "Плохо"
    } 
  end

  def self.get_status_weight
    status = {
      0..16                  => "Анорексия",
      16.1..18.5             => "Дефицит_массы_тела",
      18.5..24.99            => "Норма",
      25..30                 => "Избыток_массы_тела",
      30..35                 => "Первая_стадия_ожирения",
      35..40                 => "Вторая_стадия_ожирения",
      35..Float::INFINITY    => "Третья_стадия_ожирения"
    } 
  end

  def self.get_status_activity
    status = {
      "Низкая_активность"                => 1.2,
      "Небольшая_активность"             => 1.38,
      "Средне_статистическа_активность"  => 1.55,
      "Высокая_активность"               => 1.73
    } 
  end 

  def self.parse_params(params)
    index = []
    params.each { |key, value|  index << value.to_f unless value.nil? }
    index
  end

  def self.find_status(obtained_statuses, parametr)
    obtained_statuses.select { |val| val === parametr }.values.first
  end

  private

 

end
  

