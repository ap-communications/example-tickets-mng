require 'rails_helper'

RSpec.describe "issues/show", type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      author: nil,
      assigned_to: nil,
      issue_category: nil,
      title: "Title",
      body: "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Body/)
  end
end
