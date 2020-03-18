class HomeController < ApplicationController
  def top
    @search_word = params[:search_word]
    @issues = if @search_word.present?
                # Issue.es_search(@search_word).map {|r| r['_source'] }
                Issue.fulltext_search(@search_word).records
              else
                Issue.all
              end
  end

  def search
    @issues = if @search_word.present?
                # Issue.es_search(@search_word).map {|r| r['_source'] }
                Issue.fulltext_search(@search_word).records
              else
                Issue.all
              end
  end
end
