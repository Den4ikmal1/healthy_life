json.array!(@process_trainings) do |process_training|
  json.extract! process_training, :id
  json.url process_training_url(process_training, format: :json)
end
