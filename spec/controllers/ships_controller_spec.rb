RSpec.describe Api::V1::ShipsController, :type => :controller do
  before (:each) do
    @ship = create(:ship)
  end

  it "GET #index" do
    get :index, format: :json
    expect(response).to be_success
    expect(JSON(response.body).size).to eq(1)
  end

  it "GET #show" do
    get :show, id: @ship.id, format: :json
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(JSON(response.body)['name']).to eq(@ship.name)
  end
end