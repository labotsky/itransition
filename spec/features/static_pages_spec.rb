require 'spec_helper.rb'
describe 'Static Pages' do
  subject{ page }
  describe 'should have right content at home page' do
    before {visit root_path}
    it {should have_link('Sign In')}
    it {should have_link('Sign Up')}
    it {should have_content('Welcome to the web site!')}
    it {should have_content('Category')}
    it {should have_content('Language')}
    it {should have_content('Theme')}
  end
end