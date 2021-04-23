class Student < User
  has_one :student_info
  has_one :cart
  has_one :major, through: :student_info
  has_one :credit_card_info, through: :student_info
  has_many :courses
  has_many :purchased_histories
  has_many :feedbacks
  accepts_nested_attributes_for :major
  after_save :save_attributes

  def build_default_student_info
    build_student_info
    build_cart
    true
  end

  def save_attributes
    student_info.save
    cart.save
  end
end
