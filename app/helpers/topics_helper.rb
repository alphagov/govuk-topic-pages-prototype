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
end
