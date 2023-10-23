require 'rails_helper'

RSpec.describe "Log in page" do 
  it "can log in a user if valid password is input" do
    user = User.create(id: 1, name: "guy", email:"guy@guy.com", password: "password", password_confirmation: "password")
    visit login_path

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"

    expect(current_path).to eq(user_path(user.id))
  end 

  it "doesn't log you in if the user doesn't exist" do 
    visit login_path

    fill_in :email, with: "Name"
    fill_in :password, with: "password"
    click_button "Log In"

    expect(current_path).to eq(login_path)
  end
end