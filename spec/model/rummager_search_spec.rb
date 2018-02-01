require 'rails_helper'

RSpec.describe RummagerSearch, type: :model do
  include ServicesRequestHelpers

  describe "#search_results" do
    it "should return rummager search results" do
      stub_rummager("12345")

      results = RummagerSearch.new("12345").search_results

      results_keys = ["title", "link"].sort
      results.each do |result|
        expect(result.keys).to include(*results_keys)
      end
      expect(results.length).to eq(2)
    end
  end
end
