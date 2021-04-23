class Teacher < User
  has_one :teacher_info
  has_many :purchased_histories
  has_one :discipline, through: :teacher_info
  #has_many :courses, through: :teacher_info
  #has_and_belongs_to_many :courses
  after_save :save_attributes

  def save_attributes
    teacher_info.save
  end
end
