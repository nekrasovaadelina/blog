class CommentDecorator < ApplicationDecorator
  delegate :text, :created_at

  def user_name
    user.full_name
  end

  def author
    comment.user.id
  end

  private

  def user
    comment.user.decorate
  end
end
