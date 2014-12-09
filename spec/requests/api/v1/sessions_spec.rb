require 'spec_helper'

describe "Sessions API" do

  let(:user) { create(:user) }
 
  context "when go to /sessions/create" do
  
    it "with no POST data" do
      post '/api/sessions/create'
      expect(response).to_not be_success
      expect(response.status).to eq(400)
    end

    it "with correct credentials" do
      post '/api/sessions/create', {
        login_name: user.login_name,
        password: user.password
      }
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(json['data']).to have_key('access_token')
      expect(json['data']['access_token']).to eq(AccessToken.where(user_id: user.id).last.token)
    end

    it "with incorrect credentials" do
      post '/api/sessions/create', {
        login_name: 'bad_name',
        password: 'bad_password8'
      }
      expect(response).to_not be_success
      expect(response.status).to eq(400)
      expect(json['info']).to eq('error')
      expect(json['errors']).to include('invalid login and password')
    end
  end

end
