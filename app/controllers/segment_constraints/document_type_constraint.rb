require "open-uri"

class DocumentTypeConstraint
  # Rummager's migrated formats yml doesn't contain all formats, so we need to hardcode these into our prototype
  HARDCODED_FORMATS = %w(residential_property_tribunal_decision task_list calculator field_of_operation html_publication imported ministerial_role organisation person policy_area services_and_information take_part topical_event topical_event_about_page working_group world_location worldwide_organisation corporate_information_page closed_consultation consultation_outcome esi_fund external_content national news_article official open_consultation statistics_announcement topic world_location_news_article)

  def initialize
    @doc_types = load_document_types
  end

  def load_document_types
    document_formats_yaml_data = Services.document_formats

    document_formats_yaml_data.each do |_, doc_formats|
      doc_formats.delete_if { |doc_format| doc_format.is_a? Hash }
    end

    document_formats_yaml_data.values.flatten + HARDCODED_FORMATS
  end

  def matches?(request)
    @doc_types.include?(request.path_parameters[:document_type])
  end
end


