FactoryBot.define do
  factory :contact, class: Contact do
    user
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
    sequence(:email) { |n| "#{user.first_name}_contact_#{n}@email.com" }
    sequence(:phone) { |n| "#{n}" }
    role { 0 }
  end
end
