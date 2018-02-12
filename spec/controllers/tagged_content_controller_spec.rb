require 'rails_helper'

RSpec.describe TaggedContentController, type: :controller do
  include ContentSchemaHelpers
  include ServicesRequestHelpers

  describe "GET #show" do
    before(:each) do
      @path = "foo/bar"
      @document_type = "publication"
      content_store_has_item("/#{@path}")
      stub_any_rummager_search
    end

    it "returns success when passed valid path for a taxon" do
      get :show, params: { path: @path, document_type: @document_type }

      expect(response).to have_http_status(:success)
    end

    it "renders the :show template" do
      get :show, params: { path: @path, document_type: @document_type }

      expect(subject).to render_template("tagged_content/show")
    end
  end
end
