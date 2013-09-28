require 'spec_helper'
require "cancan/matchers"
describe CanCan do  
  subject(:ability){ Ability.new(user) }

  context "when is an account banned" do
    let(:user) {FactoryGirl.create(:user)}

    it{ should be_able_to(:manage, Poem.new) }
  end
end
