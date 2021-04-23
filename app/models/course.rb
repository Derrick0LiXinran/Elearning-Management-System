class Course < ApplicationRecord
    has_and_belongs_to_many :students
    has_and_belongs_to_many :carts
    has_and_belongs_to_many :teacher_infos
    belongs_to :major
    belongs_to :discipline
    has_many :purchased_histories
    before_save :save_major_discipline

    def save_major_discipline
        major.save
        discipline.save
    end

end
