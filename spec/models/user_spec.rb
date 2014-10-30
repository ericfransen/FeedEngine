describe User, type: :model do
  it { should have_many :github_goals }
  it { should validate_presence_of :name}
end
