class ArticleDecorator < ApplicationDecorator
  delegate :title, :text
  delegate :full_name, to: :user, prefix: :user

  def published_at
  	"Published by #{user_full_name} at #{object.created_at.to_s(:short)}"
  end

  def comments
  	object.comments.includes(:user).decorate
  end

  private

  def user
  	object.user.decorate
  end
end
