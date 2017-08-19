class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :session

  validates_uniqueness_of :user_id, scope: :session_id, message: 'can just leave one feeback per session'
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
