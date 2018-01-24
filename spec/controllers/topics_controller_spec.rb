require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  describe "GET #index" do
    it "returns success" do
      get :index

      expect(response).to have_http_status(:success)
    end

    it "renders the :index template" do
      get :index

      expect(subject).to render_template("topics/index")
    end
  end
end
