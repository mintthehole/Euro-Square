class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_role,:name
  has_many :sales_call_entries
  has_many :sales_call_enquiries
  ROLES = ["Sales","Admin","Operation"]

  def sales?
  	user_role == "Sales"
  end

  def admin?
  	user_role == "Admin"
  end

  def operation?
  	user_role == "Operation"
  end
end
