class Comment < ActiveRecord::Base
  belongs_to :code
  belongs_to :user
end
