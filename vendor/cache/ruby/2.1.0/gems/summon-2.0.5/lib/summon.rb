require 'cgi'
require 'json'

module Summon

  require 'summon/version'
  require 'summon/log'
  require 'summon/service'
  require 'summon/transport'
  require 'summon/schema'
  require 'summon/schema/query'
  require 'summon/schema/search'
  require 'summon/schema/facet'
  require 'summon/schema/range'
  require 'summon/schema/document'
  require 'summon/schema/date'
  require 'summon/schema/suggestion'
  require 'summon/schema/availability'
  require 'summon/schema/citation'
  require 'summon/schema/error'
  require 'summon/schema/recommendation_list'

  def self.escape(value)
    value.gsub(/(,|\(|\)|\{|\}|\$|\:)/, '\\\\\1').gsub("\\", '\\')
  end

  def self.unescape(value)
    value.gsub(/\\(.)/, '\1')
  end
end

unless Object.method_defined?(:tap)
  class Object
    def tap(&block)
      yield self
      return self
    end
  end
end
