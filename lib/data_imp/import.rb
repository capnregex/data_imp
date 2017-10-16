
class DataImp
  module Import
    def parse(line)
      options.merge(line: line)
    end

    def importer opts
      Importer.find(opts[:importer])
    end

    def parser opts
      Parser.find(opts[:parser]).new(opts)
    end

    def import line
      line.strip!
      return if line =~ /^#/
      opts = parse(line)
      importer(opts).process parser(opts)
    end

    def import_list list
      list.each_line do |line|
        import line
      end
    end

    def show_progress index
    end
  end
end
