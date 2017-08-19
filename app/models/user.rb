class User < ActiveRecord::Base
  has_many :feedbacks
  has_many :sessions, through: :feedbacks
end
