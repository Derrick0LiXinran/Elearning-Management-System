class CreditCardInfoController < ApplicationController
  before_action :set_credit_card_info, only: [:show, :edit, :update]

  def show
    @student = Student.find(params[:student_id])
    if @student.student_info.credit_card_info.nil?
      @student.student_info.build_credit_card_info
      @student.student_info.credit_card_info.save(:validate => false)
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @credit_card_info.update(credit_card_info_params)
        format.html { redirect_to student_credit_card_info_path(@student, @credit_card_info), notice: 'Credit Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_card_info }
      else
        format.html { render :edit }
        format.json { render json: @credit_card_info.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_credit_card_info
    if current_user.type == 'Student'
      @student = Student.find(params[:student_id])
    elsif current_user.type == 'Admin'
      @student = Student.find(params[:student_id])
    end
    @credit_card_info = @student.credit_card_info
    # @credit_card_info = CreditCardInfo.find_by_student_info_id(params[:student_id])
  end

  def credit_card_info_params
    params.require(:credit_card_info).permit(:name, :card_number, :expiration_date, :cvv)
  end
end
