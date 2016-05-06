require './app/models/user'

describe User do
  subject(:user) {described_class.create(email: 'amy@gmail.com',
    password: 'password', password_confirmation: 'password')
    }

  describe "authenticating user on signup" do
    context "when correct password" do
      it "expects authentice to return true" do
        expect(User.authenticate(user.email, user.password)).to eq user
      end
    end

    context "when incorrect password" do
      it "expects authenticate to return false" do
        expect(User.authenticate(user.email, "not_password")).to eq nil
      end
    end
  end
end
