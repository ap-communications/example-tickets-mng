class CreateIssueCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :issue_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
