class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

def create
    super do |resource|
      BackgroundWorker.trigger(resource)
    end
end


  # def user_login
  #   session[:login] = 1
  #   flash[:notice] = "user successfully logged in, cart reset."
  #   redirect_to :controller => :quiz
  # end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  #DELETE /resource/sign_out
  def destroy
    super
  end


  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
