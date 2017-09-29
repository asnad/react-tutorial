FactoryGirl.define do
  factory :message do
    trait :important do
      important true
    end
  end
end