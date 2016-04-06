module ApplicationHelper
  def admin
    @current_user.username == "jhlechiaq"
  end
end
