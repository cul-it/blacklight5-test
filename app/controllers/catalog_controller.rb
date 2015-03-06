# -*- encoding : utf-8 -*-
#
class CatalogController < ApplicationController  

  include Blacklight::Catalog
#  include BlacklightCornell::CornellCatalog

  #self.solr_search_params_logic << :sortby_title_when_browsing

  configure_blacklight do |config|
    ## Default parameters to send to solr for all search-like requests. See also SolrHelper#solr_search_params

    config.default_solr_params = {
      :qt => 'search',
      :rows => 20,
# DISCOVERYACCESS-1472      :fl => '*,score',
# Look into removing :fl entirely during off sprint
#      :fl => 'id title_display fulltitle_display fulltitle_vern_display title_uniform_display subtitle_display author_display language_display pub_date_display format url_access_display item_record_display holdings_record_display score',
      :defType => 'edismax'
    }
    
    ## list of display fields with icon
    config.display_icon = {
        'format' => 1
    }

    ## list of clickable display fields mapped to target index field
    ## target index field should be defined in add_search_field later this file
    ## target index field is searched when this link is clicked
    config.display_clickable = {
        'author_display' => {
            :search_field => 'author/creator',
            :sep => '|',
            :sep_display => ' / ',
            :pair_list => true
        },
        'author_addl_display' => {
            :search_field => 'author/creator',
            :sep => '|',
            :sep_display => ' / ',
            :pair_list => true
        },
        'subject_display' => {
            :search_field => 'subject',
            :sep => '|',
            :sep_index => ' ',
            :sep_display => ' > ',
            :hierarchical => true
        },
        'title_uniform_display' => {
            :search_field => 'title',
            :related_search_field => 'author/creator',
            :sep => '|',
            :key_value => true
        },
        'title_series_display'  => 'title',
        'continues_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'continues_in_part_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'supersedes_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'absorbed_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'absorbed_in_part_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'continued_by_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'continued_in_part_by_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'superseded_by_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'absorbed_by_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'absorbed_in_part_by_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'split_into_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'merger_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'translation_of_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'has_translation_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'other_edition_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'has_supplement_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'supplement_to_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'other_form_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'issued_with_display' => {
            :search_field => 'title',
            :sep => '|',
            :key_value => true
        },
        'included_work_display' => {
            :search_field => 'title',
            :related_search_field => 'author/creator',
            :sep => '|',
            :key_value => true
        },
        'related_work_display' => {
            :search_field => 'title',
            :related_search_field => 'author/creator',
            :sep => '|',
            :key_value => true
        }
    }

    config.display_link = {
        'url_access_display' => { :label => 'Access content' },
        'url_other_display'  => { :label => 'Other online content' },
        'url_bookplate_display'  => { :label => 'Bookplate' },
        'url_findingaid_display'  => { :label => 'Finding Aid' }

    }

    ## custom multi-valued fields separator
    config.multiline_display_fields = {
        'pub_info_display' => '<br/>',
        'edition_display' => '<br/>',
        'subject_display' => '<br/>',
        'notes' => '<br/>'
    }

    ## Default parameters to send on single-document requests to Solr. These settings are the Blackligt defaults (see SolrHelper#solr_doc_params) or
    ## parameters included in the Blacklight-jetty document requestHandler.
    #
    #config.default_document_solr_params = {
    #  :qt => 'document',
    #  ## These are hard-coded in the blacklight 'document' requestHandler
    #  # :fl => '*',
    #  # :rows => 1
    #  # :q => '{!raw f=id v=$id}'
    #}

    # solr field configuration for search results/index views
    config.index.title_field = 'title_display', 'subtitle_display', 'fulltitle_vern_display' #display as 'fulltitle_vern / title : subtitle'
  #  config.index.record_display_type = 'format'

    # solr field configuration for search results/index views
    config.index.display_type_field = 'format'

    # solr field configuration for document/show views
    config.show.title_field = 'title_display'
    config.show.title_field = 'title_display'
    config.show.display_type_field = 'format'

    # solr field configuration for document/show views
    #config.show.title_field = 'title_display'
    #config.show.display_type_field = 'format'

    # solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _displayed_ in a page.    
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or 
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.  
    #
    # :show may be set to false if you don't want the facet to be drawn in the 
    # facet bar
    config.add_facet_field 'online', :label => 'Access', :limit => 2
    config.add_facet_field 'format', :label => 'Format', :limit => 10
    config.add_facet_field 'author_facet', :label => 'Author/Creator', :limit => 5
    config.add_facet_field 'pub_date_facet', :label => 'Publication Year', :range => {
      :num_segments => 6,
      :assumed_boundaries => [1300, Time.now.year + 1],
      :segments => true,
      :include_in_advanced_search => false
    }, :show => true, :include_in_advanced_search => false

    config.add_facet_field 'language_facet', :label => 'Language', :limit => 5 , :show => true
    config.add_facet_field 'subject_topic_facet', :label => 'Subject/Genre', :limit => 5
    config.add_facet_field 'subject_geo_facet', :label => 'Subject: Region', :limit => 5
    config.add_facet_field 'subject_era_facet', :label => 'Subject: Era', :limit => 5
    config.add_facet_field 'subject_content_facet', :label => 'Fiction/Non-Fiction', :limit => 5
    config.add_facet_field 'lc_1letter_facet', :label => 'Call Number', :limit => 5
    config.add_facet_field 'location_facet', :label => 'Library Location', :limit => 5
    config.add_facet_field 'hierarchy_facet', :hierarchy => true
    # config.add_facet_field 'facet', :multiple => true
    # config.add_facet_field 'first_facet,last_facet', :pivot => ['first_facet', 'last_facet']
    # config.add_facet_field 'my_query_field', :query => { 'label' => 'value:1', 'label2' => 'value:2'}
    # config.add_facet_field 'facet', :single => true
    # config.add_facet_field 'facet', :tag => 'my_tag', :ex => 'my_tag'

    config.default_solr_params[:'facet.field'] = config.facet_fields.keys






    config.add_facet_field 'example_pivot_field', :label => 'Pivot Field', :pivot => ['format', 'language_facet']

    config.add_facet_field 'example_query_facet_field', :label => 'Publish Date', :query => {
       :years_5 => { :label => 'within 5 Years', :fq => "pub_date:[#{Time.now.year - 5 } TO *]" },
       :years_10 => { :label => 'within 10 Years', :fq => "pub_date:[#{Time.now.year - 10 } TO *]" },
       :years_25 => { :label => 'within 25 Years', :fq => "pub_date:[#{Time.now.year - 25 } TO *]" }
    }


    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
#    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display 
    config.add_index_field 'title_display', :label => 'Title'
    config.add_index_field 'title_vern_display', :label => 'Title'
    config.add_index_field 'author_display', :label => 'Author'
    config.add_index_field 'author_vern_display', :label => 'Author'
    config.add_index_field 'format', :label => 'Format', :helper_method => :render_format_value
    config.add_index_field 'language_display', :label => 'Language'
    #config.add_index_field 'published_display', :label => 'Published:'
    #config.add_index_field 'published_vern_display', :label => 'Published'
    config.add_index_field 'lc_callnum_display', :label => 'Call number'
    config.add_index_field 'pub_date', :label => 'Publication date'
    config.add_index_field 'pub_info_display', :label => 'Publication'
    config.add_index_field 'edition_display', :label => 'Edition'

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display 
    config.add_show_field 'title_uniform_display', :label => 'Uniform title'
    config.add_show_field 'author_cts', :label => 'Author/Creator'
    config.add_show_field 'format', :label => 'Format'
    config.add_show_field 'language_display', :label => 'Language'
    config.add_show_field 'edition_display', :label => 'Edition'
    config.add_show_field 'pub_info_display', :label => 'Published'
    config.add_show_field 'pub_prod_display', :label => 'Produced'
    config.add_show_field 'pub_dist_display', :label => 'Distributed'
    config.add_show_field 'pub_manu_display', :label => 'Manufactured'
    config.add_show_field 'pub_copy_display', :label => 'Copyright date'
    config.add_show_field 'publisher_number_display', :label => 'Publisher number'
    config.add_show_field 'other_identifier_display', :label => 'Other identifier'
    config.add_show_field 'cite_as_display', :label => 'Cite as'
    config.add_show_field 'historical_note_display', :label => 'Biographical/ Historical note'
    config.add_show_field 'finding_aids_display', :label => 'Finding aid'
    config.add_show_field 'subject_cts', :label => 'Subject'
    config.add_show_field 'summary_display', :label => 'Summary'
    config.add_show_field 'description_display', :label => 'Description'
    #config.add_show_field 'isbn_t', :label => 'ISBN'
    config.add_show_field 'issn_display', :label => 'ISSN'
    config.add_show_field 'isbn_display', :label => 'ISBN'
    config.add_show_field 'frequency_display', :label => 'Frequency'
    config.add_show_field 'author_addl_cts', :label => 'Other author/creator'
    config.add_show_field 'title_series_display', :label => 'Series'
    config.add_show_field 'contents_display', :label => 'Table of contents'
    config.add_show_field 'partial_contents_display', :label => 'Partial table of contents'
    config.add_show_field 'title_other_display', :label => 'Other title'
    config.add_show_field 'included_work_display', :label => 'Included work'
    config.add_show_field 'related_work_display', :label => 'Related Work'
    config.add_show_field 'continues_display', :label => 'Continues'
    config.add_show_field 'continues_in_part_display', :label => 'Continues in part'
    config.add_show_field 'supersedes_display', :label => 'Supersedes'
    config.add_show_field 'absorbed_display', :label => 'Absorbed'
    config.add_show_field 'absorbed_in_part_display', :label => 'Absorbed in part'
    config.add_show_field 'continued_by_display', :label => 'Continued by'
    config.add_show_field 'continued_in_part_by_display', :label => 'Continued in part by'
    config.add_show_field 'superseded_by_display', :label => 'Superseded by'
    config.add_show_field 'absorbed_by_display', :label => 'Absorbed by'
    config.add_show_field 'absorbed_in_part_by_display', :label => 'Absorbed in part by'
    config.add_show_field 'split_into_display', :label => 'Split into'
    config.add_show_field 'merger_display', :label => 'Merger'
    config.add_show_field 'translation_of_display', :label => 'Translation of'
    config.add_show_field 'has_translation_display', :label => 'Has translation'
    config.add_show_field 'other_edition_display', :label => 'Other edition'
    config.add_show_field 'indexed_selectively_by_display', :label => 'Indexed Selectively By'
    config.add_show_field 'indexed_by_display', :label => 'Indexed By'
    config.add_show_field 'references_display', :label => 'References'
    config.add_show_field 'indexed_in_its_entirety_by_display', :label => 'Indexed in its Entity By'
    config.add_show_field 'in_display', :label => 'In'
    config.add_show_field 'map_format_display', :label => 'Map Format'
    config.add_show_field 'has_supplement_display', :label => 'Has supplement'
    config.add_show_field 'supplement_to_display', :label => 'Supplement to'
    config.add_show_field 'other_form_display', :label => 'Other form'
    config.add_show_field 'issued_with_display', :label => 'Issued with'
    config.add_show_field 'notes', :label => 'Notes'
    config.add_show_field 'donor_display', :label => 'Donor'
    config.add_show_field 'url_bookplate_display', :label => 'Bookplate'
    config.add_show_field 'url_other_display', :label => 'Other online content'

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different. 

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise. 
    
    config.add_search_field 'all_fields', :label => 'All Fields'
    

    # Now we see how to over-ride Solr request handler defaults, in this
    # case for a BL "search field", which is really a dismax aggregate
    # of Solr search fields. 
    
    config.add_search_field('title') do |field|
      # solr_parameters hash are sent to Solr as ordinary url query params. 
      field.solr_parameters = { :'spellcheck.dictionary' => 'title' }

      # :solr_local_parameters will be sent using Solr LocalParams
      # syntax, as eg {! qf=$title_qf }. This is neccesary to use
      # Solr parameter de-referencing like $title_qf.
      # See: http://wiki.apache.org/solr/LocalParams
      field.solr_local_parameters = { 
        :qf => '$title_qf',
        :pf => '$title_pf'
      }
    end
    
    config.add_search_field('author') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'author' }
      field.solr_local_parameters = { 
        :qf => '$author_qf',
        :pf => '$author_pf'
      }
    end
    
    # Specifying a :qt only to show it's possible, and so our internal automated
    # tests can test it. In this case it's the same as 
    # config[:default_solr_parameters][:qt], so isn't actually neccesary. 
    config.add_search_field('subject') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'subject' }
      field.qt = 'search'
      field.solr_local_parameters = { 
        :qf => '$subject_qf',
        :pf => '$subject_pf'
      }
    end

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    config.add_sort_field 'score desc, pub_date_sort desc, title_sort asc', :label => 'relevance'
    config.add_sort_field 'pub_date_sort desc, title_sort asc', :label => 'year'
    config.add_sort_field 'author_sort asc, title_sort asc', :label => 'author'
    config.add_sort_field 'title_sort asc, pub_date_sort desc', :label => 'title'

    # If there are more than this many search results, no spelling ("did you 
    # mean") suggestion is offered.
    config.spell_max = 5
  end

end 
