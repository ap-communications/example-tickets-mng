require 'rails_helper'

RSpec.describe "issues/edit", type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      author: nil,
      assigned_to: nil,
      issue_category: nil,
      title: "MyString",
      body: "MyString"
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do

      assert_select "input[name=?]", "issue[author_id]"

      assert_select "input[name=?]", "issue[assigned_to_id]"

      assert_select "input[name=?]", "issue[issue_category_id]"

      assert_select "input[name=?]", "issue[title]"

      assert_select "input[name=?]", "issue[body]"
    end
  end
end
