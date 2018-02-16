require 'rails_helper'

RSpec.describe RummagerSearch, type: :model do
  include ServicesRequestHelpers

  let(:subject) { described_class.new("12345") }

  describe "#search_results" do
    it "should return rummager search results" do
      stub_rummager

      results = subject.search_results

      results_keys = ["title", "link", "format"].sort
      results.each do |result|
        expect(result.keys).to include(*results_keys)
      end
      expect(results.count).to eq(2)
    end
  end

  describe "#search_results_count" do
    it "should give the number of results returned from rummager" do
      stub_rummager

      results_count = subject.search_results_count

      expect(results_count).to eq(2)
    end
  end
end
