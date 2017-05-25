FactoryGirl.define do
  factory :offspring do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    grade      { Offspring.grades.keys.sample }
    age        { Faker::Number.between(8, 10) }
    user
  end
end
