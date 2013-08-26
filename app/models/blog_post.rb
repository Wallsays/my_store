# for blog and post commenting
class BlogPost < ActiveRecord::Base
  has_many :comments, as: :commentable
end
