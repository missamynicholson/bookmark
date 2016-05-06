feature "signing in" do
  let (:params) {{email: "my_email_address@email.com",
                 password: "my_password",
                 confirm_password: "my_password" }}
  before do
    sign_up(params)
  end

  scenario "sign in with correct credentials" do
    sign_in(params[:email], params[:password])
    expect(page).to have_content "Hello #{params[:email]}!"
  end

  scenario "sign in with incorrect password" do
    sign_in(params[:email], "wrong_password")
    expect(page).to have_content "Incorrect email and password combination"
  end

  scenario "sign in with unrecognised email address" do
    sign_in("unregistered_email@email.com", params[:password])
    expect(page).to have_content "Incorrect email and password combination"
  end
end
