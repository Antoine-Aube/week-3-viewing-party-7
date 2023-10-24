require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do 
    @user1 = User.create(name: "User One", email: "user1@test.com", password: "password", password_confirmation: "password")
    user2 = User.create(name: "User Two", email: "user2@test.com", password: "password", password_confirmation: "password")
    visit '/'
  end 

  it 'has a header' do
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has links/buttons that link to correct pages' do 
    click_button "Create New User"
    
    expect(current_path).to eq(register_path) 
    
    visit '/'
    click_link "Home"

    expect(current_path).to eq(root_path)
  end 

  # it 'lists out existing users' do 
  #   user1 = User.create(name: "User One", email: "user1@test.com", password: "password", password_confirmation: "password")
  #   user2 = User.create(name: "User Two", email: "user2@test.com", password: "password", password_confirmation: "password")

  #   expect(page).to have_content('Existing Users:')

  #   within('.existing-users') do 
  #     expect(page).to have_content(user1.email)
  #     expect(page).to have_content(user2.email)
  #   end     
  # end 

  it "will not allow a user to visit dashboard unless they are loggedin" do 
    # visit login_path
    # fill_in :email, with: @user1.email
    # fill_in :password, with: @user1.password
    # click_button 'Log In'
    visit user_path


    expect(page).to have_content("You must be logged in to access your dashboard")
    expect(current_path).to eq(root_path)
  end

  it "logs out a user when a user presses log out on the landing page" do 
    visit login_path
    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password
    click_button 'Log In'

    visit root_path

    expect(page).to have_link("Log out")
    click_link "Log out"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Log out")
    expect(page).to have_link("Log in")
  end
end
