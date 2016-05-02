class PersonalCharacteristic < ActiveRecord::Base
  belongs_to :user
  belongs_to :coach
  ACTIVITY_TYPES = ["low_activity", "small_activity", "normal_activity", "greater_activity"]
  attr_accessor :my_field



  def self.index_rufe(params_rufe)
    parametr_rufe = (4 * (parse_params(params_rufe).reduce :+ ) - 200)/10
    { "value": parametr_rufe.round(2), "name": interpretation_index_rufe(parametr_rufe) }
  end

  def self.index_weight(params_weight)
    index = parse_params(params_weight)
    parametr_weight = index[0] / ((index[1] / 100) ** 2)
    { "value": parametr_weight.round(2), "name": interpretation_index_weight(parametr_weight) }
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
      0..5                   => "good",
      5.1..10                => "normal",
      10..15                 => "satisfactorily",
      15.1..Float::INFINITY  => "bad"
    } 
  end

  def self.get_status_weight
    status = {
      0..16                  => "severe underweight",
      16.1..18.5             => "underweight",
      18.5..24.99            => "normal",
      25..30                 => "overweight",
      30..35                 => "obesity_first_degree",
      35..40                 => "obesity_seconf_degree",
      35..Float::INFINITY    => "obesity_third_degree"
    } 
  end

  def self.get_status_activity
    status = {
      "low_activity"         => 1.2,
      "small_activity"       => 1.38,
      "normal_activity"      => 1.55,
      "greater_activity"     => 1.73
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
end
  

