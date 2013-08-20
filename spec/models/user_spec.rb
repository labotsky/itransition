require 'spec_helper.rb'
describe User do

  before do
    @user = User.new(email:'sergey1993.test@mail.ru', password: '123456789',
                    password_confirmation: '123456789', confirmation_token: '',
                    confirmed_at: Time.now)
  end

  subject {@user}
  it {should respond_to(:email)}
  it {should respond_to(:poems)}
  it {should be_valid}

  describe 'when email not present' do
    before {@user.email = ''}
    it {should_not be_valid}
  end

  describe 'when password not present' do
    before {@user.password = ''}
    it {should_not be_valid}
  end

  describe 'when password_confirmation not present' do
    before {@user.password_confirmation = ''}
    it {should_not be_valid}
  end

  describe 'when email format is invalid' do
    it 'should be invalid' do
      addresses = %w[user@foo,by user_foo.by user@foo@foo.by foo@user+foo.by]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe 'when email is longer then 50' do
    before {@user.email = 'a'*51}
    it {should_not be_valid}
  end

  describe 'when email is already taken' do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email
      user_with_same_email.save
    end
    it {should_not be_valid}
  end
end