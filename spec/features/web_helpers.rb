# def create_link_with_tag(tag)
#   visit('/links/new')
#   fill_in :title, with: 'Google'
#   fill_in :url, with: 'www.google.com'
#   fill_in :tag, with: tag
#   click_button 'Submit'
# end
#
# def sign_up(params)
#   visit "/users/new"
#   expect(page.status_code).to eq(200)
#   fill_in :password, with: params[:password]
#   fill_in :password_confirmation, with: params[:confirm_password]
#   fill_in :email, with: params[:email]
#   click_button 'Signup'
# end
#
# def sign_in(email, password)
#   visit "/users/signin"
#   fill_in :password, with: password
#   fill_in :email, with: email
#   click_button 'Sign in'
# end
