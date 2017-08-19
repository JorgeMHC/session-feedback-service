describe Feedback do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to belong_to(:session) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:session_id).with_message(/can just leave one feeback per session/)  }
end
