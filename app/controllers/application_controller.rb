class ApplicationController < ActionController::Base

  def after_sign_up_path_for(resource)
    admin_root_path
  end
end
