class User < ApplicationRecord
  has_many :posts
  has_many :created_posts, class_name: 'Post', foreign_key: 'user_id'
end
