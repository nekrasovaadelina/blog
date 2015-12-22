class ApplicationDecorator < Draper::Decorator
  def user_full_name
    object.user.full_name
  end
end
