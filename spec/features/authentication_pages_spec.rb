require 'spec_helper.rb'
describe 'Authentication Pages' do
  subject{ page }
  let(:user) {create(:user)}
  before{visit new_user_session_path}

  describe 'should have right content at authentication page' do
    it {should have_content('Please sign in')}
    it {should have_content('Remember me')}
    it {should have_content('Forgot your password?')}
    it {should have_content('Didn\'t receive confirmation instructions?')}
  end

  describe 'when not right data sign in' do
    before do
      fill_in 'user_email', with: 'sergey1993.08@mail.ru'
      fill_in 'user_password', with: '123456789'
      find("input[value='Please sign in']").click
    end
    it {should have_content('Please sign in')}  
  end

  describe 'when right data sign in' do
    before{sign_in user}
    it {should have_content('Logged in as '+ user.email)}
    it {should have_link('Sign Out')}
    it {should have_link('My Poems')}
    it {should have_selector('div.message')}  
  end

  describe 'should have right content in sign up page' do
    before {visit new_user_registration_path}
    it {should have_content('Sign Up')}
    it {should have_link('Sign In')}      
    it {should have_link('Forgot your password?')}      
    it {should have_link('Didn\'t receive confirmation instructions?')}      
  end

  describe 'should have right content in forgot password page' do
    before {visit new_user_password_path}
    it {should have_content('Forgot your password?')}
  end

  describe 'should have right content in confirmation page' do
    before {visit new_user_confirmation_path}
    it {should have_content('Resend confirmation instructions')}
  end                     
end