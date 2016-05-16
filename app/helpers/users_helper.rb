module UsersHelper
  def weight_data(test)
    weight = []
    test.each do |f|
      weight << f.activity_index
    end
    index = weight.join(", ")

    (3.weeks.ago.to_date..Time.zone.now).map do |date|
      {
        created_at: date,
        activity_index: test
      }
    end
  end
end
