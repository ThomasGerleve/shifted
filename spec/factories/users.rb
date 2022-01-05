FactoryBot.define do
  factory :user do
    first_name { "Testuser" }
    last_name { "Rspec" }
    experience_level { "Beginner" }
    functional_role

  end
end
