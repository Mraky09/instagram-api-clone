FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password_digest { FFaker::Internet.password }

    to_create { |user| User.create(user) }
  end
end
