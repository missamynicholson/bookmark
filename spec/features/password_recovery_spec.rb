feature "password recovery" do
  scenario "ask for password recovery" do
    visit ('/users/signin')
    click_link 'Reset password'
    expect(page).to have_content "Please enter your email address"
  end

  scenario "user can submit their email for recovery" do
    visit ('/users/signin')
    click_link 'Reset password'
    fill_in :email, with: "my_email_address@email.com"
    click_button 'Reset'
    expect(page).to have_content "Check your emails"
  end
end
