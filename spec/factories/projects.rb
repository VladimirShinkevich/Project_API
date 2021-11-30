FactoryBot.define do
  factory :project do
    title { 'MyTitle' }

    trait :invalid do
      title { nil }
    end

    trait :with_to_do do
      after(:create) do |project|
        create(:to_do, project: project)
      end
    end
  end
end
