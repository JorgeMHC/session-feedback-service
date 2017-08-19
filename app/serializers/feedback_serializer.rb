class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :created_at, :updated_at

  belongs_to :user
  belongs_to :session
end
