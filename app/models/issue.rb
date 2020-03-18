class Issue < ApplicationRecord
  include IssueSearchable

  belongs_to :author, class_name: 'User'
  belongs_to :assigned_to, class_name: 'User'
  belongs_to :issue_category
end
