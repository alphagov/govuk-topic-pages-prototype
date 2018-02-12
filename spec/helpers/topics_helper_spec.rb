require 'rails_helper'

RSpec.describe TopicsHelper do
  include TaggedContentHelpers

  describe "#document_type_count" do
    it "should return total counts for document types" do
      mock_tagged_content = mocked_tagged_content

      document_count = document_type_count(mock_tagged_content)

      expect(document_count["publication"]).to eq(2)
    end
  end

  describe "#group_tagged_content" do
    it "should group the tagged content by document type" do
      tagged_content = mocked_tagged_content

      grouped_tagged_content = grouped_tagged_content(tagged_content)

      expect(grouped_tagged_content.keys().length).to eq(3)

      expected_groups = %w[publication news_article organisation].sort
      expect(grouped_tagged_content.keys()).to include(*expected_groups)

      expect(grouped_tagged_content["news_article"]).to include(
        {
          "format" => "news_article",
          "link" => "/government/news/education-bill-receives-royal-assent",
          "title"=>"Education Bill receives Royal Assent"
        }
      )

      expect(grouped_tagged_content.find_index { |k,_| k == "publication" }).to eq(0)
    end
  end
end
