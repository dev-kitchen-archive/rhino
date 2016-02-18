FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    password 'secret123'
  end
end
