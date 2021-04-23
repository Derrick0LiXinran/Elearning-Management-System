class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  def index
    @teachers = Teacher.all
  end
  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.build_teacher_info
    @teacher.discipline = Discipline.find_by_name(discipline_params[:name])
    respond_to do |format|
      if @teacher.teacher_info.save && @teacher.save
        if current_user.type == 'Admin'
          format.html { redirect_to teachers_path, notice: 'Teacher was successfully created.' }
        else
          format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
          format.json { render :show, status: :created, location: @teacher }
        end
        else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        @teacher.discipline = Discipline.find_by_name(discipline_params[:name])
        @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :address, :phone_number)
  end

  def discipline_params
    params.require(:discipline).permit(:name)
  end
end
