class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  expose_decorated(:article, attributes: :article_params) 
  expose_decorated(:articles) { |default| default.includes(:user) }
  expose_decorated(:comment) { article.comments.build }

  def new
  end

  def create
    article.user = current_user
    article.save

    respond_with(article)
  end

  def edit
  end

  def update
    article.save
      
    respond_with(article)
  end

  def index
  end

  def show
  end

  def destroy
    article.destroy

    respond_with(article)
  end

  private

    def authorize_user!
      authorize(article, :manage?)  
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end
end
