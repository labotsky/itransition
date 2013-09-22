require 'spec_helper.rb'
describe Category do
  before do
    @category = Category.new(name: 'lorem', description: 'lorem description')    
  end

  subject {@category}
  it {should respond_to(:name)}
  it {should respond_to(:description)}
  it {should respond_to(:poems)}
  it {should be_valid}

  describe 'when name is not present' do
    before {@category.name = nil}
    it {should_not be_valid}
  end

  describe 'when description is not present' do
    before {@category.description = nil}
    it {should_not be_valid}
  end 
end  