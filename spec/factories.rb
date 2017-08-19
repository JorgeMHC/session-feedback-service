FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "first_name_#{n}" }
    sequence(:last_name) { |n| "last_name_#{n}" }
  end

  factory :feedback do

    trait :excelent do
      rating 5
      comment 'That was an excelent seesion'
    end

    trait :good do
      rating 4
      comment 'It was a good session'
    end

    trait :regular do
      rating 3
      comment 'Session was not that bad'
    end

    trait :bad do
      rating 2
      comment 'It was a bad session'
    end

    trait :horrible do
      rating 1
      comment 'OMG That was bad'
    end
  end

  factory :session do
    sequence(:name) { |n| "session_name_#{n}" }
    sequence(:summary) { |n| "session_summary_#{n}" }
  end
end
