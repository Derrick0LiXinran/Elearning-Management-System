class StudentInfo < ApplicationRecord
  belongs_to :student
  has_one :credit_card_info
  belongs_to :major, class_name: 'Major', foreign_key: :major
  has_and_belongs_to_many :courses

end
