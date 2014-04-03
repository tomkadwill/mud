class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email, :case_sensitive => false
  
  belongs_to :level
  belongs_to :stage
  
  after_create :assign_first_level
  
  def assign_first_level
    update_attributes(level: Level.first, stage: Stage.first)
  end
end
