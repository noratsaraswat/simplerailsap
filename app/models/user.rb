class User < ActiveRecord::Base
   has_one :role
   has_many :teacher_lessons
   has_many :student_lessons
   has_many :student_details
   accepts_nested_attributes_for :role
   

   # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name,:role_attributes
  # def role=(attrs_array)
  #   attrs_array.each do |attrs|
  #     role.create(attrs)
  #   end
  # end
  
 def with_role
    self.build_role 
    self
  end
end
