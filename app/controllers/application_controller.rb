class ApplicationController < ActionController::Base
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end
git 