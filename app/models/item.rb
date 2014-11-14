class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  default_scope { order('updated_at DESC') }

  def destruction_time
      7.days+self.created_at
  end
end
