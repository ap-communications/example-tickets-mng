module IssueSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name "es_issue_#{Rails.env}"

    settings do
      mappings dynamic: 'false' do
        indexes :author, type: 'keyword'
        indexes :assigned_to, type: 'keyword'
        indexes :issue_category, type: 'keyword'
        indexes :title, type: 'text', analyzer: 'kuromoji'
        indexes :body, type: 'text', analyzer: 'kuromoji'
      end
    end

    def as_indexed_json(*)
      attributes
        .symbolize_keys
        .slice(:title, :body)
        .merge(author: author_name, assigned_to: assigned_to_name, issue_category: issue_category_name)
    end
  end

  def author_name
    author.name
  end

  def assigned_to_name
    assigned_to.name
  end

  def issue_category_name
    issue_category.name
  end

  class_methods do
    def create_index!
      client = __elasticsearch__.client
      client.indices.delete index: self.index_name rescue nil
      client.indices.create(index: self.index_name,
                            body: {
                                settings: self.settings.to_hash,
                                mappings: self.mappings.to_hash
                            })
    end

    def fulltext_search(query)
      __elasticsearch__.search({
        query: {
          multi_match: {
            fields: %w(author assigned_to issue_category title body),
            type: 'cross_fields',
            query: query,
            operator: 'and'
          }
        }
      })
    end
  end
end
# { "query": { "multi_match": { "fields": ["author", "assigned_to", "issue_category", "title", "body"], "type": "cross_fields", "query": "すね", "operator": "and" } } }
