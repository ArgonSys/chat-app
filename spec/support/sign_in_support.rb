module SignInSupport
  def sign_in(user, correct: true)
    visit root_path
    expect(current_path).to eq new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    find("input[name='commit']").click
    sleep 1
    expect(current_path).to\
     eq(correct ? root_path : new_user_session_path)
  end
end
