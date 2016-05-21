FactoryGirl.define do
  factory :newsletter_subscription do
    name 'John Doe'
    email 'john@example.org'
    source 'ios'
    language 'en'
  end
end
