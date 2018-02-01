require 'gds_api/test_helpers/content_store'

module ContentSchemaHelpers
  include GdsApi::TestHelpers::ContentStore

  def example_content_schema(format, example_name)
    example_schema = GovukContentSchemaTestHelpers::Examples.new.get(format, example_name)
    JSON.parse(example_schema)
  end
end