feature "signing out" do

  let (:params) {{email: "my_email_address@email.com",
                 password: "my_password",
                 confirm_password: "my_password" }}
  before do
    sign_up(params)
  end

  scenario "expect user to be signed out" do
    sign_out
    expect(page).to have_content "Good bye"
    expect(page).not_to have_content "Hello #{params[:email]}!"
  end
end
