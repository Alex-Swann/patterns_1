require 'json'

class Converter
  def initialize(string, location)
    @string = string
    @location = location
  end

  def convert(type)
    @string.upcase!
    @location.upcase!
    if type == :text
      "#{@string} #{@location}"
    elsif type == :html
      "<html><head></head><body>#{ @string } #{@location}</body></html>"
    elsif type == :json
      { response: "#{@string} #{@location}" }.to_json
    elsif type == :xml
      "<response>#{ @string } #{@location}</response>"
    else
      raise "Unrecognised type"
    end
  end
end