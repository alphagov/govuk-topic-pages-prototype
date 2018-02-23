module TopicsHelper
  def document_type_count(tagged_content)
    document_count = {}

    tagged_content.each do |content_item|
      document_format = content_item["format"]

      if document_count.has_key?(content_item["format"])
        document_count[document_format] = document_count[document_format] + 1
      else
        document_count[document_format] = 1
      end
    end

    document_count.sort_by {|_key, value| value}.reverse.to_h
  end

  def grouped_tagged_content(tagged_content)
    grouped_content = {}

    tagged_content.each do |content_item|
      document_format = content_item["format"]

      if grouped_content.has_key? document_format
        grouped_content[document_format] << content_item
      else
        grouped_content[document_format] = [content_item]
      end
    end

    grouped_content.sort_by {|_key, value| value.count}.reverse.to_h
  end

  def finder_url_and_path(taxon_path, document_type)
    finder_app_url = ENV['FINDER_APP_URL'] || "https://finder-frontend-pr-411.herokuapp.com/find-all-the-things!11!?"
    filters = { taxons: taxon_path, content_purpose_document_supertype: document_type }
    finder_app_url + filters.to_query
  end
end
