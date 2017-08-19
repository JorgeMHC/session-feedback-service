class FeedbacksController < BaseController
  serialization_scope :view_context

  def index
    rating_filter = params[:rating].to_s.split(",").map(&:to_i)

    if !rating_filter.empty?
      feedbacks = Feedback.where(rating: rating_filter).last(15)
    else
      feedbacks = Feedback.last(15)
    end

    render json: feedbacks, adapter: :json_api, status: :ok
  end

  def create
    session = Session.find(params[:session_id])
    feedback = Feedback.create!(user: current_user, session: session, rating: params[:rating], comment: params[:comment])

    render json: feedback, adapter: :json_api, status: :created
  end
end
