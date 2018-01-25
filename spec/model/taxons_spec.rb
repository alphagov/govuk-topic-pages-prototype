require 'rails_helper'

RSpec.describe Taxons, type: :model do
  subject { described_class.new }
  describe "#level_one_taxons" do

    before(:each) do
      @taxons = subject.level_one_taxons
    end

    it "returns a list of level one taxons" do
      expect(@taxons.length).to eq(21)
    end

    it "returns the title and base_path of a taxon" do
      taxon_keys = ["title", "base_path"].sort

      @taxons.each do |taxon|
        expect(taxon.keys).to include(*taxon_keys)
      end
    end
  end
end
