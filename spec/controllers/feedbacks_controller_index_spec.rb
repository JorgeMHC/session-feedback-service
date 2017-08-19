describe 'FeedbacksController#index' do

  let!(:set_up_db) {
    # create 3 users
    create_list(:user, 3)

    # create 10 sessions
    sessions = create_list(:session, 10)

    # create 30 feedback (10 per session)
    sessions.each do |session|
      create(:feedback, :excelent, user: User.first, session: session)
      create(:feedback, :good, user: User.second, session: session)
      create(:feedback, :regular, user: User.third, session: session)
    end
  }

  describe 'when valid information is provided' do
    it 'contains 30 feedbacks in the db' do
      expect(Feedback.count).to eq(30)
    end

    it 'shows 15 feedbacks if not filter is provided' do
      get "/feedbacks"

      expect(response).to have_http_status(:ok)
      expect(parse_response(response).count).to eq(15)
    end

    it 'shows 10 feedbacks when filter by rating is passed' do
      get "/feedbacks?rating=5"

      expect(response).to have_http_status(:ok)
      expect(parse_response(response).count).to eq(10)
    end
  end

  def parse_response(response)
    JSON.parse(response.body)['data']
  end
end
