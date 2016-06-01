require_relative 'text_parser'
require_relative 'html_parser'
require_relative 'json_parser'
require_relative 'xml_parser'

# Understands the conversion of strings to abstract types
class Converter
  def initialize(string, location)
    @string = string
    @location = location
  end

  def convert(type)
    raise "Unrecognised type" unless known_parser?(type)
    parser_of_type(type).convert
  end

  private

  attr_reader :string

  PARSERS = { text: TextParser, html: HtmlParser, json: JsonParser, xml: XmlParser }.freeze

  def known_parser?(type)
    PARSERS.include?(type)
  end

  def parser_of_type(type)
    location_censor
    PARSERS[type].new(string.upcase)
  end

  def location_censor
     @string += ' ' + ('*' * @location.length)
  end
end