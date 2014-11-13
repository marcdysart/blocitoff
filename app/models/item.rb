class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  default_scope { order('updated_at DESC') }
end
