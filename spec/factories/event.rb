FactoryBot.define do

  factory :event do
    name                {"運動会"}
    school_id           {"1"}
    web_public          {"0"}
    public_start_date   {"2019/01/01"}
    public_end_date     {"2019/01/02"}
    remarks             {"運動会"}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    school
  end

end