class AskCommentPolicy < ApplicationPolicy
  def manage?
    user == record.user || user.roles == "admin"
  end
end
