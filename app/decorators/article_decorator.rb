class ArticleDecorator < ApplicationDecorator
  delegate :title, :text, :created_at
  delegate :id, :full_name, to: :user, prefix: :user

  def user_name
    user.full_name
  end

  def author
    article.user.id
  end

  private

  def user
    article.user.decorate
  end
end
