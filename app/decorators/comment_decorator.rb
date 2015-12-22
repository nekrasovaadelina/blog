class CommentDecorator < ApplicationDecorator
  delegate :text

  def published_at
    "Published by #{user_full_name} at #{object.created_at.to_s(:short)}"
  end
end
