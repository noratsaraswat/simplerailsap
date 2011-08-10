class ClassDetail < ActiveRecord::Base
    has_many :lesson_classes
    has_many :student_details
    validates_uniqueness_of :classname
end
