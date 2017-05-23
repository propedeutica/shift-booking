######################################################
# Class Admin
# Only administration tasks, different to users
######################################################
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :lockable, :timeoutable,
         :rememberable, :trackable, :validatable
end
