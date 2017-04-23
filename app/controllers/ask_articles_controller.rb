class AskArticlesController < ApplicationController
  expose(:ask_article)
  expose(:ask_articles) { |scope| fetch_articles(scope) }
  expose(:ask_comment) { ask_article.comments.build }
  expose(:ask_comments, ancestor: :ask_article) { |scope| fetch_comments(scope) }

  def index
  end

  def show
  end

  private

  def fetch_articles(scope)
    scope.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
  end

  def fetch_comments(scope)
    scope.includes(:user).order(:created_at)
  end
end
