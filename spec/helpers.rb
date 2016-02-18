module Helpers
  def login(email: 'vitaliy.fry@gmail.com', password: 'password')
    visit new_user_session_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    click_button "Войти"
  end
end
