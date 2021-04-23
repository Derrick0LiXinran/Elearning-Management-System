class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def getPastTeachers(student)
    teachers = []
    student.purchased_histories.each do |history|
      if !teachers.include?(history.teacher)
        teachers.push(history.teacher)
      end
    end
    return teachers
  end
  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
    if params.has_key?(:student_id)
      @student = Student.find(params[:student_id])
    end
    if params.has_key? :teacher_id
      @feedbacks = Feedback.where(teacher_id: current_user.id)
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
    @student = Student.find(params[:student_id])
    @teachers = getPastTeachers(@student)
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    teacher_name = params.require(:feedback).permit(:teacher)[:teacher]
    teacher = Teacher.find_by_name(teacher_name)
    p = feedback_params
    p[:teacher_id] = teacher.id
    puts p
    @feedback = Feedback.new(p)


    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
      if params.has_key?(:student_id)
        @student = Student.find(params[:student_id])
      end
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      # params.fetch(:feedback, {})
      params.require(:feedback).permit(:title, :text)

    end
end
