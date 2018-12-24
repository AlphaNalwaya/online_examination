class User::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]

  GET /resource/sign_in
  def new
    super
  end

  POST /resource/sign_in
  def create
    super
  end

  DELETE /resource/sign_out
  def destroy
    super
    redirect_to root_url
  end
end