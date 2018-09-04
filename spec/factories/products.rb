FactoryBot.define do
  factory :product do
    slug "MyString"
    title_en "MyString"
    title_fr { title_en }
    description_en "Lorem Ipsum Dolor Sit Amet Blablabla"
    description_fr { description_en }

    category

    trait :with_property do
      specific { create :property }
    end
  end
end
