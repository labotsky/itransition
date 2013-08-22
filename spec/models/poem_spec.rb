require 'spec_helper.rb'
describe Poem do
  let(:user) {FactoryGirl.create(:user)}
  before do
    @poem = user.poems.build(name: 'lorem', body: 'lorem ipsum...', description: 'lorem description')
  end

  subject {@poem}
  it {should respond_to(:name)}
  it {should respond_to(:body)}
  it {should respond_to(:paragraphs)}
  it {should respond_to(:categories)}
  it {should be_valid}

  describe 'when name is not present' do
    before {@poem.name = nil}
    it {should_not be_valid}
  end

  describe 'when description is not present' do
    before {@poem.description = nil}
    it {should_not be_valid}
  end

  describe 'when body is not present' do
    before {@poem.body = nil}
    it {should_not be_valid}
  end          
end  