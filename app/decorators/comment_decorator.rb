class CommentDecorator < ApplicationDecorator
  delegate :text

  def published_at
    "Published by #{user.full_name} at #{object.created_at.to_s(:short)}"
  end

  private

  def user
    object.user.decorate
  end
end
