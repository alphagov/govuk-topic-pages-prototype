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
end
