class PurchasedHistoriesController < ApplicationController
  before_action :set_purchased_history, only: [:show, :edit, :update, :destroy]


  def add_to_purchase_history
    student = Student.find(params[:id])
    student.cart.course_packages.each do |package|
      PurchasedHistory.create(student: student, course: package.course, teacher: package.teacher)
      StudentRegisterToClassTeacherMailer.with(package: package.id, student: student.id).student_register_to_class_teacher_email.deliver_now
      package.destroy
    end
    redirect_to student_cart_path(student, student.cart.id), notice: 'Courses Were Purchased'
  end

  def test
    if params.key? :course_id
      @purchased_histories = PurchasedHistory.where(course_id: params[:course_id])
    end

  end
  
  def student_history
    if params.key? :student_id
      @purchased_histories = PurchasedHistory.where(student_id: params[:student_id])
    end
  end

  # GET /purchased_histories
  # GET /purchased_histories.json
  def index
    if params.key? :course_id
      @purchased_histories = PurchasedHistory.where(course_id: params[:course_id])
    elsif params.key? :student_id
      @purchased_histories = PurchasedHistory.where(student_id: params[:student_id])
    elsif params.key? :teacher_id
      @purchased_histories = PurchasedHistory.where(teacher_id: params[:teacher_id])
    end
    render :show
  end

  # GET /purchased_histories/1
  # GET /purchased_histories/1.json
  def show
    @purchased_histories = PurchasedHistory.all
    if current_user.type == 'Student'
      @purchased_histories = PurchasedHistory.where(student_id: current_user.id)
    elsif current_user.type == 'Teacher'
      @purchased_histories = PurchasedHistory.where(teacher_id: current_user.id)
    end
  end

  # GET /purchased_histories/new
  def new
    @purchased_history = PurchasedHistory.new
  end

  # GET /purchased_histories/1/edit
  def edit
  end

  # POST /purchased_histories
  # POST /purchased_histories.json
  def create
    @purchased_history = PurchasedHistory.new(purchased_history_params)

    respond_to do |format|
      if @purchased_history.save
        format.html { redirect_to @purchased_history, notice: 'Purchased history was successfully created.' }
        format.json { render :show, status: :created, location: @purchased_history }
      else
        format.html { render :new }
        format.json { render json: @purchased_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchased_histories/1
  # PATCH/PUT /purchased_histories/1.json
  def update
    respond_to do |format|
      if @purchased_history.update(purchased_history_params)
        format.html { redirect_to @purchased_history, notice: 'Purchased history was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchased_history }
      else
        format.html { render :edit }
        format.json { render json: @purchased_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchased_histories/1
  # DELETE /purchased_histories/1.json
  def destroy
    @purchased_history.destroy
    respond_to do |format|
      format.html { redirect_to purchased_histories_url, notice: 'Purchased history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchased_history
      @purchased_history = PurchasedHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchased_history_params
      params.fetch(:purchased_history, {})
    end
end
