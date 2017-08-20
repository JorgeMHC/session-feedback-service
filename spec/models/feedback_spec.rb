describe Feedback do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to belong_to(:session) }
  it { should validate_presence_of(:rating) }

  # It tests that the feedback can just have one user per session
  it { should validate_uniqueness_of(:user_id).scoped_to(:session_id).with_message(/can just leave one feeback per session/)  }

  it 'should not be valid if rating is out of the range 1 to 5' do
    user = create(:user)
    session = create(:session)

    feedback = build(:feedback, user: user, session: session)
    feedback.rating = 0
    expect(feedback.valid?).to be false

    feedback.rating = 6
    expect(feedback.valid?).to be false
  end

  it 'should be valid if rating is in the range 1 to 5' do
    user = create(:user)
    session = create(:session)

    feedback = build(:feedback, user: user, session: session)
    feedback.rating = 1
    expect(feedback.valid?).to be true

    feedback.rating = 5
    expect(feedback.valid?).to be true
  end
end
