module SchemaParser
  class SchemaLink
    def initialize(node_a, node_b)
      @node_a = node_a
      @node_b = node_b
    end

    def link?
      case_a = @node_b.attrs.include?("#{@node_a.name.underscore}_id:int(11)")
      case_b = @node_a.attrs.include?("#{@node_b.name.underscore}_id:int(11)")
      case_a || case_b
    end
  end
end
