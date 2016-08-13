require "rails_helper"

RSpec.describe Api::V1::CargoesController, :type => :controller do
  before (:each) do
    create(:port)
    @cargo = create(:cargo)
  end

  it "GET #index" do
    get :index, format: :json
    expect(response).to be_success
    expect(JSON(response.body).size).to eq(1)
  end

  it "GET #show" do
    get :show, id: @cargo.id, format: :json
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(JSON(response.body)['name']).to eq(@cargo.name)
  end
end

# describe "GET 'show' " do
#     let(:student) { create(:student) }

#     it "returns a successful 200 response" do
#       get :student, id: student, format: :json
#       expect(response).to be_success
#     end

#     it "returns data of an single student" do
#       get :student, id: student, format: :json
#       parsed_response = JSON.parse(response.body)
#       expect(parsed_response['student']).to_not be_nil
#     end

#     it "returns an error if the student does not exist" do
#       get :student, id: 10 , format: :json
#       parsed_response = JSON.parse(response.body)
#       expect(parsed_response['error']).to eq("Student does not exist")
#       expect(response).to be_not_found
#     end
  # end