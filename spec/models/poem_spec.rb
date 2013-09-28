require 'spec_helper.rb'
describe Poem do
  let(:poem){create(:poem)}

  subject {poem}
  it {should respond_to(:name)}
  it {should respond_to(:body)}
  it {should respond_to(:paragraphs)}
  it {should respond_to(:categories)}
  it {should be_valid}

  describe 'when name is not present' do
    before {poem.name = nil}
    it {should_not be_valid}
  end

  describe 'when description is not present' do
    before {poem.description = nil}
    it {should_not be_valid}
  end

  describe 'when body is not present' do
    before {poem.body = nil}
    it {should_not be_valid}
  end

  describe '.set_permalink' do
    let(:poem){create(:poem, name: '123.abc/qwe zxc')}
    it {poem.permalink.should be == '123-abc-qwe-zxc'}  
  end          
end  