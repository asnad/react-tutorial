require "rails_helper"
RSpec.describe Api::StaticResponsesController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      hash_body = nil
      get :home, format: :json
      expect(response.status).to eq(200)
    end

    it "home api response" do
      hash_body = nil
      get :home, format: :json
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body).to match({
        message: 'Hello World'
      })
    end
  end
end