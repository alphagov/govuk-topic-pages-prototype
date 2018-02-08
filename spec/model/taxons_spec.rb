require 'rails_helper'

RSpec.describe Taxons, type: :model do
  include ContentSchemaHelpers

  subject { described_class.new }
  describe "#level_one_taxons" do

    before(:each) do
      root_taxon = content_item_for_base_path("/").merge(
        "links": {
          "level_one_taxons": [
            {
              "base_path": "/taxon-one",
              "title": "Taxon one"
            },
            {
              "base_path": "/taxon-two",
              "title": "Taxon two"
            }
          ]
        }
      )
      content_store_has_item("/", root_taxon)
      @taxons = subject.level_one_taxons
    end

    it "returns a list of level one taxons" do
      expect(@taxons.length).to eq(2)
    end

    it "returns the title and base_path of a taxon" do
      taxon_keys = ["title", "base_path"].sort

      @taxons.each do |taxon|
        expect(taxon.keys).to include(*taxon_keys)
      end
    end
  end
end
