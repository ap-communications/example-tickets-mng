FactoryBot.define do
  factory :issue do
    author { nil }
    assigned_to { nil }
    issue_category { nil }
    title { "MyString" }
    body { "MyText" }
  end
end
