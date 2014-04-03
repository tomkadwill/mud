class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email, :case_sensitive => false
  
  belongs_to :level
  
  after_create :assign_first_level
  
  def assign_first_level
    update_attribute(:level, Level.first)
  end
end
