module WelcomeHelper
  def gw_pass
    current_user.settings(:dashboard).gw_pass
  end

  def gw_user
    current_user.settings(:dashboard).gw_user
  end
end
