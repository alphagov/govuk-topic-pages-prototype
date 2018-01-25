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

  describe "GET #show" do
    it "returns success when passed valid path for a taxon" do
      get :show, params: { path: "foo/bar" }

      expect(response).to have_http_status(:success)
    end

    it "renders the :show template" do
      get :show, params: { path: "foo/bar" }

      expect(subject).to render_template("topics/show")
    end
  end
end
