FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    stage
  end
end
