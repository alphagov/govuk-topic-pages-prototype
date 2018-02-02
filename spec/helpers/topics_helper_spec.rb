require 'rails_helper'

RSpec.describe TopicsHelper do
  describe "#document_type_count" do
    it "should return total counts for document types" do
      mock_tagged_content = [
        {
        "format" => "publication",
        "link" => "/government/publications/esfa-update-january-2017",
        "title"=>"ESFA update: January 2017"
      },
      {
        "format" => "publication",
        "link" => "/government/publications/esfa-update-january-2018",
        "title"=>"ESFA update: January 2018"
      }
    ]

    document_count = document_type_count(mock_tagged_content)

    expect(document_count["publication"]).to eq(2)
    end
  end
end
