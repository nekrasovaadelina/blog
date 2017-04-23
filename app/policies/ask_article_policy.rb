class AskArticlePolicy < ApplicationPolicy
  def manage?
    user.roles == "admin"
  end

  def creator?
  	user == record.user
  end
end
