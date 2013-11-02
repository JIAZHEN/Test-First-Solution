class XmlDocument

  def initialize(indent = false)
    @indent = indent
    @indent_level = 0
  end

  def method_missing(method_name, *args, &block)
    xml, attributes = "", args[0] || {}
    xml << ("  " * @indent_level) if @indent
    xml << "<#{method_name}"
    xml << " " + attributes.map { |k, v| "#{k}='#{v}'" }.join(' ') unless attributes.empty?
    if block_given?
      @indent_level += 1
      xml << ">"
      xml << "\n" if @indent
      xml << yield
      @indent_level -= 1
      xml << ("  " * @indent_level) if @indent
      xml << "</#{method_name}>"
      xml << "\n" if @indent
      
    else
      xml << "/>"
      xml << "\n" if @indent
    end
    xml
  end
end