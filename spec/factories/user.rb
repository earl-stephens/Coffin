FactoryBot.define do
  factory :user, class: User do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
    sequence(:email) { |n| "user_#{n}@email.com" }
    sequence(:phone) { |n| "#{n}" }
    sequence(:address) { |n| "Address #{n}" }
    organ_donor { [true, false].sample }
    sequence(:place_of_birth) { |n| "Place of birth #{n}" }
    maiden_name { nil }
    deceased { false }
    sequence(:google_token) { |n| "#{n}" }
    sequence(:google_uid) { |n| "#{n}" }
  end
end
