require 'spec_helper'

feature "the sign-up process" do
  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Registration"
  end

  it "shows smiley face after sign-up" do
    sign_up_as('hello_world')
    expect(page).to have_content "=)"
  end
end
