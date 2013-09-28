require 'spec_helper'

describe PoemDecorator do
  let(:poem) {create(:poem)}
  subject { poem.decorate }
  its(:pdf_button) { should have_selector('i.icon-download-alt')}
  its(:edit_button) { should have_selector('i.icon-edit')}
end
