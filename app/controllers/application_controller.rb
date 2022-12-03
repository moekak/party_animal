class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # 編集画面から画像を受け取れるよう設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i(image))
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    posts_path
  end
end
