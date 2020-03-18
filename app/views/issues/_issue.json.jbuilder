json.extract! issue, :id, :author_id, :author_name, :assigned_to_id, :assigned_to_name, :issue_category_id, :issue_category_name, :title, :body, :updated_at
json.url issue_url(issue, format: :json)
