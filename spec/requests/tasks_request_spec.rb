require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  it "create task found" do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
    sign_in user
    post '/tasks', params: { "string": "enter", "substring": "en" }

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(1)
    expect(JSON.parse(response.body)['result'].size).to eq(5)
    expect(JSON.parse(response.body)['result']['base_string']).to eq("enter")
    expect(JSON.parse(response.body)['result']['substring']).to eq("en")
    expect(JSON.parse(response.body)['result']['status']).to eq(true)
    expect(JSON.parse(response.body)['result']['enterings']).to eq([0, 1])
  end

  it "create task not found" do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
    sign_in user
    post '/tasks', params: { "string": "enter", "substring": "en1" }

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(1)
    expect(JSON.parse(response.body)['result'].size).to eq(5)
    expect(JSON.parse(response.body)['result']['base_string']).to eq("enter")
    expect(JSON.parse(response.body)['result']['substring']).to eq("en1")
    expect(JSON.parse(response.body)['result']['status']).to eq(false)
    expect(JSON.parse(response.body)['result']['enterings']).to eq([])
  end

  it "delete task" do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
    task = Task.create(user_id: user.id, base_string: 'enter', substring: "en1", status: false)
    sign_in user
    delete "/tasks/#{task.id}"

    expect(response).to have_http_status(204)
    expect(response.body).to be_empty
  end
end
