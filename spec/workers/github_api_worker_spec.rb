describe GithubWorker, type: :model do
  it 'it can perform a job' do
    worker = GithubWorker.new
    expect(worker).to respond_to(:perform)
  end
end
