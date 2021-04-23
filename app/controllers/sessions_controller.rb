class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id


      if @user.type == 'Student'
        redirect_to student_path(@user)
      elsif @user.type == 'Admin'
        redirect_to admin_path(@user)
      elsif @user.type == 'Teacher'
        redirect_to teacher_path(@user)
      end
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def logout
    session.delete(:user_id)
    redirect_to welcome_path
  end

  def welcome
    session.delete(:user_id)
  end
end
