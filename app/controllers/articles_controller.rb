class ArticlesController < ApplicationController
  expose_decorated(:article, attributes: :article_params)
  expose_decorated(:articles) { |scope| fetch_articles(scope) } # ask right name
  expose_decorated(:comment) { article.comments.build }
  expose_decorated(:comments, ancestor: :article) { |scope| fetch_comments(scope) } # here too

  def index
  end

  def show
  end

  private

  def fetch_articles(scope)
  	scope.includes(:user).order(created_at: :desc).page(params[:page]).per(2)
  end

  def fetch_comments(scope)
  	scope.includes(:user).order(:created_at)
  end
end
