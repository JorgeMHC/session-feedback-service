class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :session

  validates_uniqueness_of :user_id, scope: :session_id, message: 'can just leave one feeback per session'
end
