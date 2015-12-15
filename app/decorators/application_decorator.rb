class ApplicationDecorator < Draper::Decorator
  def user_full_name
    object.user.full_name
  end

  def published_at
    "Published by " + user_full_name + " at " +
    object.created_at.strftime("%H:%M, %d of %B")
  end
end
