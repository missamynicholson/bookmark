feature "signing up" do
  scenario "user signs up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Hello my_email_address!"
    expect(User.first.email).to eq('my_email_address')
end

  scenario 'password confirmation on sign up' do
    expect { sign_up_wrong }.to change(User, :count).by(0)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content "Password and confirmation password do not match"
  end
end
