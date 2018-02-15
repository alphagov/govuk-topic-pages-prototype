require 'rails_helper'

RSpec.describe Taxon, type: :model do
  include ContentSchemaHelpers
  include ServicesRequestHelpers

  describe "#content_item" do
    before(:each) do
      @example_schema = example_content_schema("taxon", "taxon_with_child_taxons")
      @topic_taxon = Taxon.new("education")
    end

    it "should return content item title" do
      content_store_has_item("/education", @example_schema)

      expect(@topic_taxon.title).to eq("Taxon with children")
    end

    it "should return associated child taxons" do
      content_store_has_item("/education", @example_schema)

      child_taxons = @topic_taxon.child_taxons

      expect(child_taxons.length).to eq(1)
      expect(child_taxons.first["title"]).to eq("Further and higher education, skills and vocational training")
    end
  end

  describe "#children?" do
    before(:each) do
      @topic_taxon = Taxon.new("education")
    end

    it "should indicate that taxon has child taxons" do
      example_schema_with_children = example_content_schema('taxon', 'taxon_with_child_taxons')
      content_store_has_item("/education", example_schema_with_children)

      expect(@topic_taxon.children?).to be_truthy
    end

    it "should indicate that taxon does not have child taxons" do
      example_schema_without_children = example_content_schema('taxon', 'taxon')
      content_store_has_item("/education", example_schema_without_children)

      expect(@topic_taxon.children?).to be_falsey
    end
  end

  describe "#content_id" do
    it "should return the correct content id" do
      content_item = example_content_schema('taxon', 'taxon')
      content_store_has_item("/education", content_item)

      expect(Taxon.new("education").content_id).to eq("63d98739-fc60-4e28-a65f-edb56000fd39")
    end
  end

  describe "#child_taxon_tagged_content_count" do
    it "should return the count for a child taxon tagged content" do
      example_schema_with_children = example_content_schema('taxon', 'taxon_with_child_taxons')
      content_store_has_item("/education", example_schema_with_children)
      stub_rummager

      expect(Taxon.new("education").tagged_content_count(example_schema_with_children["content_id"])).to eq(2)
    end
  end
end

