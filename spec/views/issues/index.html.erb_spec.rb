require 'rails_helper'

RSpec.describe "issues/index", type: :view do
  before(:each) do
    assign(:issues, [
      Issue.create!(
        author: nil,
        assigned_to: nil,
        issue_category: nil,
        title: "Title",
        body: "Body"
      ),
      Issue.create!(
        author: nil,
        assigned_to: nil,
        issue_category: nil,
        title: "Title",
        body: "Body"
      )
    ])
  end

  it "renders a list of issues" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Body".to_s, count: 2
  end
end
