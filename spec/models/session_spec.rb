describe Session do
  it { expect(subject).to have_many(:feedbacks) }
  it { expect(subject).to have_many(:users) }
end
