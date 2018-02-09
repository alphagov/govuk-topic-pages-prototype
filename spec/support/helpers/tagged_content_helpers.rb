require 'rails_helper'

module TaggedContentHelpers
  def mocked_tagged_content
    [
        {
            "format" => "publication",
            "link" => "/government/publications/esfa-update-january-2017",
            "title"=>"ESFA update: January 2017"
        },
        {
            "format" => "publication",
            "link" => "/government/publications/esfa-update-january-2018",
            "title"=>"ESFA update: January 2018"
        },
        {
            "format" => "news_article",
            "link" => "/government/news/education-bill-receives-royal-assent",
            "title"=>"Education Bill receives Royal Assent"
        },
        {
            "format" => "organisation",
            "link" => "/government/organisations/department-for-education",
            "title"=>"Department for Education"
        }
    ]
  end
end

