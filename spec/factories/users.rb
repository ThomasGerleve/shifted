FactoryBot.define do
  factory :user do
    first_name { "Testuser" }
    last_name { "Rspec" }
    additional_infos { "These are additional infos" }
    functional_role

    trait :beginner do
      experience_level { "Beginner" }
    end

    trait :experienced do
      experience_level { "Experienced" }
    end
  end
end
