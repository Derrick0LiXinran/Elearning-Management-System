class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = Student.new(params.require(:user).permit(:name, :email,
                                                     :password))
    respond_to do |format|
      if @user.save
        format.html { redirect_to '/welcome', notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
