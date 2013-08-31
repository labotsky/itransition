require 'spec_helper.rb'
describe 'User Pages' do
  let(:user) {FactoryGirl.create(:user)}
  before do
    user.confirm!
    sign_in(user)
    @poem = user.poems.create(name: 'lorem', body: 'lorem ipsum...', description: 'lorem description')  
  end
  subject{ page }
  describe 'should have my poems' do
    before {visit poems_path}
    it {should have_content('My Poems')}
    it {should have_link('Add Poem', href: new_poem_path)}
    it {should have_content('lorem')}
    it {should have_content('lorem description')}
    it {should have_link('View', href: poem_path(@poem))}
    it {should have_link('Edit', href: edit_poem_path(@poem))}
    it {should have_link('Delete', href: poem_path(@poem))}
    it {should have_link('Add Paragraph '+ @poem.paragraphs.count.to_s, href: new_paragraph_path(poem: @poem.id))}    
    it {should have_link('PDF', href: poem_path(@poem, format: 'pdf'))}
    it {should have_css('.post-home', count: 1)}
    it {should have_css("#poem_"+@poem.id.to_s)}     
  end
end