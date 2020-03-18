# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.find_or_create_by(name: 'ユーザ1')
user2 = User.find_or_create_by(name: 'ユーザ2')
user3 = User.find_or_create_by(name: 'ユーザ3')
user4 = User.find_or_create_by(name: 'ユーザ4')
user5 = User.find_or_create_by(name: 'ユーザ5')
user6 = User.find_or_create_by(name: 'ユーザ6')

category1 = IssueCategory.find_or_create_by(name: '要望')
category2 = IssueCategory.find_or_create_by(name: 'バグ')
category3 = IssueCategory.find_or_create_by(name: '作業')

Issue.find_or_create_by(title: '要望1') {|issue|
  issue.author = user1
  issue.assigned_to = user2
  issue.body = '要望1の内容'
  issue.issue_category = category1
}

Issue.find_or_create_by(title: '要望2') {|issue|
  issue.author = user3
  issue.assigned_to = user4
  issue.body = '要望2の内容'
  issue.issue_category = category1
}

Issue.find_or_create_by(title: 'ElasticSearchについてですね') {|issue|
  issue.author = user1
  issue.assigned_to = user2
  issue.body = 'こんな内容です。'
  issue.issue_category = category1
}

Issue.find_or_create_by(title: '乾燥肌について') {|issue|
  issue.author = user1
  issue.assigned_to = user2
  issue.body = 'すねがかゆいです。'
  issue.issue_category = category1
}

# issue1.update_attributes(body: '要望1の内容', issue_category: category1)

p Issue.create_index!
p Issue.import
