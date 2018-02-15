require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  include ContentSchemaHelpers
  include ServicesRequestHelpers

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
    before(:each) do
      @example_schema = example_content_schema("taxon", "taxon_with_child_taxons")
      @path = "foo/bar"
      stub_content_store("/#{@path}", @example_schema)
      stub_any_rummager_search
    end

    it "returns success when passed valid path for a taxon" do
      get :show, params: { path: @path }

      expect(response).to have_http_status(:success)
    end

    it "renders the :show template" do
      get :show, params: { path: @path }

      expect(subject).to render_template("topics/show")
    end
  end
end
