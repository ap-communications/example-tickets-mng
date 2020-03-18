SELECT
  issues.id
, author_user.name AS author
, assigned_to_user.name AS assigned_to
, issue_categories.name AS issue_category
, issues.title
, issues.body
, issues.updated_at
FROM issues
LEFT OUTER JOIN users author_user
  ON issues.author_id = author_user.id
LEFT OUTER JOIN users assigned_to_user
  ON issues.assigned_to_id = assigned_to_user.id
INNER JOIN issue_categories
  ON issues.issue_category_id = issue_categories.id
WHERE
  issues.updated_at > :sql_last_value
ORDER BY issues.updated_at ASC
