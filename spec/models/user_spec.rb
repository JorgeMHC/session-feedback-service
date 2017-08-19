describe User do
  it { expect(subject).to have_many(:feedbacks) }
  it { expect(subject).to have_many(:sessions) }
end
