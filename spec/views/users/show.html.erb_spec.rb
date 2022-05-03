require 'rails_helper'

RSpec.describe "users/show", type: :view do
  describe "users/show.html.erb" do
    let(:valid_user) { FactoryBot.create(:user, name: "John", email: "john@gmail.com") }
    
    it "Show info about user" do
      assign(:user, valid_user)
      
      render
      
      expect(rendered).to match valid_user.name
      expect(rendered).to match valid_user.email
    
    end
    
    it "Show link to main list" do
      assign(:user, valid_user)

      render

      expect(rendered).to match "Back"
    end
    
  end
end

