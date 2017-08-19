require 'schema_parser/version'
require 'schema_parser/schema_node'
require 'schema_parser/schema_link'

class String
  def underscore
    self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
end

module SchemaParser
  class Parser
    def initialize(source, target)
      @source, @target = source, target
      @nodes = []
      @edges = {}
    end

    def split_into_nodes
      @nodes = File.open(@source, 'r') { |file| file.readlines }
      .reject{ |line| line.match(/^$/) }
      .join()
      .split("--------------------------------------------------")
      .map do |b|
        sources = b.lines.reject{|line| line == "\n"}
        name = sources.first.gsub("\n",'')
        attrs = sources[2..-1].map { |e| e.split(' ')
        .join(':') }
        .reject{ |s| s.include? "created_at" }
        .reject{ |s| s.include? "updated_at"}
        .reject{ |s| s == "id:int(11)"}
        .concat ["#{name.underscore}_id:int(11)"]
        .uniq
        SchemaNode.new(name, attrs)
      end
    end

    def draw
      File.open(@target, 'w+') do |writeable|
        writeable.write("digraph g {\n")
        writeable.write("node [shape=record,color=Red,fontname=Courier];\n")
        writeable.write("edge [color=Blue]\n")

        @nodes.each do |node|
          writeable.write node.to_struct
        end

        @nodes.combination(2).to_a.each do |node_a, node_b|
          link = SchemaLink.new(node_a, node_b)
          @edges["#{node_a.name}_#{node_b.name}"] = link.link?
        end

        @edges.select {|k,v|v == true}.each do |k,v|
          writeable.write "#{k.split('_')[0]} -> #{k.split('_')[1]} [dir=\"none\"]\n"
        end

        writeable.write("}\n")
      end
    end
  end
end
