class CartsController < ApplicationController
  before_action :set_cart, only: [:edit, :update, :destroy, :checkout]

  def check
    @student = Student.find(session[:student_checkout_id])
    @password = params[:q]
    @one_time_password = session[:one_time_password]
    if @password == @one_time_password
      YouHaveRegisterToClassMailer.with(student: @student.id).you_have_register_to_class_email.deliver_now

      # add to purchase history
      redirect_to add_to_purchased_history_student_path(@student)
    end
  end

  def check_password
    @student = Student.find(params[:id])
    session[:student_checkout_id] = @student.id
    session[:one_time_password] = (0...4).map { (65 + rand(26)).chr }.join
    CheckoutpasswardMailer.with(student: @student, password: session[:one_time_password]).checkoutpassward_email.deliver_now

  end
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  def remove_from_cart
    cp = CoursePackage.destroy(params[:id])
    student = Student.find(params[:student_id])
    redirect_to student_cart_path(student, student.cart.id)
  end

  def checkout
    student = Student.find(current_user.id)
    @cart.course_packages.each do |package|
      PurchasedHistory.create(course: package.course, student: student, teacher: package.teacher)
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find_by_student_id(params[:student_id])
    @student = Student.find(params[:student_id])
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit()
    end
end
