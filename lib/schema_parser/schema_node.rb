module SchemaParser
  class SchemaNode
    attr_accessor :name, :attrs
    def initialize(name, attrs)
      @name = name
      @attrs = attrs
    end

    def to_struct
      "#{@name} [label=\"#{@name}|{#{@attrs.map {|e| e.split(':')[0]}.join('|')}}\"];\n"
    end
  end
end
