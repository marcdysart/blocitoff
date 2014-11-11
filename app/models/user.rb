class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :lists, dependent: :destroy
  has_many :items, dependent: :destroy

   def admin?
     role == 'admin'
   end

   def moderator?
     role == 'moderator'
   end
end
