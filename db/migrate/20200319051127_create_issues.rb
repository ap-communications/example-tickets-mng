class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.references :author, null: false, foreign_key: { to_table: 'users' }
      t.references :assigned_to, null: true, foreign_key: { to_table: 'users' }
      t.references :issue_category, null: false, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
