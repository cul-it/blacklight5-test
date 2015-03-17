module DisplayHelper

  # Renders the format field values with applicable format icons
  def render_format_value args
    format = args[:document][args[:field]]
    # Convert format to array in case it's a string (it shouldn't be)
    format = [format] unless format.is_a? Array
    format.map do |f|
      icon = '<i class="fa fa-' + formats_icon_mapping(f) + '"></i> '
      f.prepend(icon).html_safe unless f.nil?
    end
  end

  FORMAT_MAPPINGS = {
    "Book" => "book",
    "Online" =>"link",
    "Computer File" => 'save',
    "Non-musical Recording" => "headphones",
    "Musical Score" => "musical-score",
    "Musical Recording" => "music",
    "Thesis" => "file-text-o",
    "Microform" => "th",
    "Journal" => "book-open",
    "Conference Proceedings" => "group",
    "Video" => "film",
    "Map or Globe" => "globe",
    "Manuscript/Archive" => "archive",
    "Newspaper" => "newspaper",
    "Database" => "database",
    "Image" => "picture-o",
    "Unknown" => "question-sign",
    "Kit" => "suitcase",
    "Research Guide" => "paste",
    "Course Guide" => "graduation-cap",
    "Website" => "desktop",
    "Miscellaneous" => "ellipsis-h",
    "Object" => "trophy"
  }

  def formats_icon_mapping(format)
    if (icon_mapping = FORMAT_MAPPINGS[format])
      icon_mapping
    else
      'default'
    end
  end

  # Parse other_id_display field for OCLC numbers
  def bookcover_oclc(document)
    other_ids = document['other_id_display']
    oclc_id = other_ids.find { |e| /^\(OCoLC\)/ =~ e } unless other_ids.blank?
    unless oclc_id.blank?
      # Remove '(OCLC)' prefix
      # -- really need to ask Frances about making OCLC# its own field
      oclc_id.gsub(/^\(OCoLC\)/, '')
    end
  end

  def is_shadow_record(document)
    if defined? document.to_marc
      fields = document.to_marc.find_all{|f| ('948') === f.tag }

      fields.each do |field|
        field.each do |sub|
          if h(sub.code) === 'h' and h(sub.value) === 'PUBLIC SERVICES SHADOW RECORD'
            return true
          end
        end
      end

      return false
    end
  end

  # for display of | delimited fields
  # only displays the string before the first |
  # otherwise, it does same as render_index_field_value
  def render_delimited_index_field_value args
    value = args[:value]

    if args[:field] and blacklight_config.index_fields[args[:field]]
      field_config = blacklight_config.index_fields[args[:field]]
      value ||= send(blacklight_config.index_fields[args[:field]][:helper_method], args) if field_config.helper_method
      value ||= args[:document].highlight_field(args[:field]) if field_config.highlight
    end

    value ||= args[:document].get(args[:field], :sep => nil) if args[:document] and args[:field]

    newval = nil
    unless value.nil?
      if value.class == Array
        newval = Array.new
        value.each do |v|
          newval.push (v.split('|'))[0] unless v.blank?
        end
      else
        ## string?
        newval = (value.split('|'))[0] unless value.blank?
      end
    end

    render_field_value newval
  end

  # for display of | delimited fields
  # only displays the string before the first |
  # otherwise, it does same as render_index_field_value
  def render_pair_delimited_index_field_value args
    value = args[:value]

    if args[:field] and blacklight_config.index_fields[args[:field]]
      field_config = blacklight_config.index_fields[args[:field]]
      value ||= send(blacklight_config.index_fields[args[:field]][:helper_method], args) if field_config.helper_method
      value ||= args[:document].highlight_field(args[:field]) if field_config.highlight
    end

    value ||= args[:document].get(args[:field], :sep => nil) if args[:document] and args[:field]

    newval = nil
    unless value.nil?
      value_array = value.split('|')
      vals = []
      i = 0
      value_array.each do |v|
        vals.push v if i % 2 == 0
        i = i + 1
      end
      newval = vals.join(' / ')
    end

    render_field_value newval
  end

  def online_url(document)
    if document['url_access_display'].present?
      if document['url_access_display'].size > 1
        catalog_path(document)
      else
        render_display_link(:document => document, :field => 'url_access_display', :format => 'url')
      end
    end
  end

  def render_display_link args
    label = blacklight_config.display_link[args[:field]][:label]
    links = args[:value]
    links ||= args[:document].get(args[:field], :sep => nil) if args[:document] and args[:field]
    render_format = args[:format] ? args[:format] : 'default'

    value = links.map do |link|
      #Check to see whether there is metadata at the end of the link
      url, *metadata = link.split('|')
      if links.size == 1 && render_format == 'url'
        return url.html_safe
      end
      if metadata.present?
        label = metadata[0]
      end
      link_to(process_online_title(label), url.html_safe, {:class => 'online-access'})
    end

    if render_format == 'raw'
      return value
    else
      render_field_value value
    end
  end


end