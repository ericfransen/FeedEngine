describe GithubApiWorker, type: :model do

  it 'can make requests to the API' do
    github_worker = GithubApiWorker.new
    expect(github_worker).to respond_to(:perform)
  end

end
