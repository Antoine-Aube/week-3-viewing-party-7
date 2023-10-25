require 'rails_helper'

RSpec.describe 'Admin Dashboard' do
  
  describe 'when I visit "admin/dashboard" as an admin' do
    it "I see a link to all the non-admin users' dashboards" do
      admin_user = User.create(name:"AdminGuy", email: "admin@admin.com", password: "password", role: 2)
      default_user_1 = User.create(name:"DefaultGuy", email: "guy@guy.com", password: "anotherpassword", role: 0)
      visit login_path

      fill_in :email, with: admin_user.email
      fill_in :password, with: admin_user.password
      click_button "Log In"

      expect(current_path).to eq(admin_dashboard_path)

      expect(page).to have_link(default_user_1.email)

    
    end
  end
end