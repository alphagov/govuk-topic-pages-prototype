require 'rails_helper'
require 'gds_api/test_helpers/content_store'

RSpec.describe Taxon, type: :model do
  include GdsApi::TestHelpers::ContentStore

  describe "#content_item" do
    before(:each) do
      example_schema_string = GovukContentSchemaTestHelpers::Examples.new.get('taxon', 'taxon_with_child_taxons')
      @example_schema = JSON.parse(example_schema_string)
    end

    it "should return content item title" do
      allow(Services.content_store).to receive(:content_item).with("/education").and_return(@example_schema)

      topic_taxon = Taxon.new("education")
      expect(topic_taxon.title).to eq("Taxon with children")
    end
  end
end

