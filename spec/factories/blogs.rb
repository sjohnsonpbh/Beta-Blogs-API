FactoryBot.define do
  factory :blog do
    title { "MyString" }
    content { "MyString" }
    image_path { "MyString" }
    sub_title { "MyString" }
    user { nil }
  end
end
