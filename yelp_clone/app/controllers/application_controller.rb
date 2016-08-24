class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
  def new_session_path(scope)
    new_user_session_path
  end
=======

  # def new_session_path(scope)
  #   new_user_session_path
  # end

>>>>>>> 9f7adf5f154c973973058b5e410df89cd3671b18
end
