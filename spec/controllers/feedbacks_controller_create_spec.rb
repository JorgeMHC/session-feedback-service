describe 'FeedbacksController#create' do
  let(:user) { create(:user) }
  let(:session) { create(:session) }

  describe 'when all parameters are ok' do
    it 'creates a feedback' do
      post "/sessions/#{session.id}/feedbacks", params(5, 'It was a grat session'), headers(user.id)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'when contains invalid parameters' do
    it 'return a :not_found response when user is not found' do
      post "/sessions/#{session.id}/feedbacks", params(5, 'It was a grat session'), headers('invalid_user_id')

      expect(response).to have_http_status(:not_found)
    end

    it 'return a :not_found response when the session is not found' do
      post "/sessions/invalid_session_id/feedbacks", params(5, 'It was a grat session'), headers(user.id)

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'users can create only one feedback per session' do
    it 'creates only one feedback per session per user' do
      post "/sessions/#{session.id}/feedbacks", params(5, 'It was a grat session'), headers(user.id)
      expect(response).to have_http_status(:created)

      post "/sessions/#{session.id}/feedbacks", params(5, 'It was a grat session'), headers(user.id)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  private

  def headers(user_id)
    { 'HTTP_UBI_USERID' => user_id }
  end

  def params(rating, comment='')
    {
      rating: rating,
      comment: comment
    }
  end
end
