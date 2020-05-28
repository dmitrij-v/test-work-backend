require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "get current user" do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
    sign_in user
    get "/current-user"

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body).size).to eq(3)
    expect(JSON.parse(response.body)['email']).to eq(user.email)
    expect(JSON.parse(response.body)['tasks']).to be_empty
  end
end