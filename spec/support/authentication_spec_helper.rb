module AuthHelper
  def sign_up_as(name, email)
    visit new_user_url
    fill_in "user[name]", with: name
    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    click_button "Create account"
  end

  # def login_as(user)
  #   visit new_session_url
  #   fill_in "user[username]", with: user.username
  #   fill_in "user[password]", with: "password"
  #   click_button "Log In"
  # end
end


# FactoryGirl.define do
#   factory :user do
#     username { Faker::Internet.user_name }
#     password "password"
#
#     factory :user_hw do
#       username "hello_world"
#     end
#
#     factory :user_foo do
#       username "foo_bar"
#     end
#   end
# end
