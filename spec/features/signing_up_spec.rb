feature "signing up" do

  scenario "user signs up" do
    params = {email: "my_email_address@email.com",
              password: "password",
              confirm_password: "password" }
    expect { sign_up(params) }.to change(User, :count).by(1)
    expect(page).to have_content "Hello my_email_address@email.com!"
    expect(User.first.email).to eq('my_email_address@email.com')
  end

  scenario "cannot sign up if password mismatch" do
    params = {email: "my_email_address@email.com",
              password: "password",
              confirm_password: "password1" }
    expect { sign_up(params) }.to change(User, :count).by(0)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content "Password and confirmation password do not match"
  end

  scenario "can't sign up without an email address" do
    params = {email: nil,
              password: "password",
              confirm_password: "password" }
    expect { sign_up(params) }.to change(User, :count).by(0)
  end

  scenario "can't sign up without a valid email address" do
    params = {email: "my_email_address@email",
              password: "password",
              confirm_password: "password" }
    expect { sign_up(params) }.to change(User, :count).by(0)
  end
end
