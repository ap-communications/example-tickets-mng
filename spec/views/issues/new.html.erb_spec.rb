require 'rails_helper'

RSpec.describe "issues/new", type: :view do
  before(:each) do
    assign(:issue, Issue.new(
      author: nil,
      assigned_to: nil,
      issue_category: nil,
      title: "MyString",
      body: "MyString"
    ))
  end

  it "renders new issue form" do
    render

    assert_select "form[action=?][method=?]", issues_path, "post" do

      assert_select "input[name=?]", "issue[author_id]"

      assert_select "input[name=?]", "issue[assigned_to_id]"

      assert_select "input[name=?]", "issue[issue_category_id]"

      assert_select "input[name=?]", "issue[title]"

      assert_select "input[name=?]", "issue[body]"
    end
  end
end
