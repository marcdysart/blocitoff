class List < ActiveRecord::Base
  has_many :items
  belongs_to :user

  default_scope { order('created_at DESC') }


   validates :title, length: { minimum: 5 }, presence: true
   validates :user, presence: true
end
