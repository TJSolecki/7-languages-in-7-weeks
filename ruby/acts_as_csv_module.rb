module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    class CsvRow
      attr_accessor :headers, :csv_row

      def initialize(csv_row, headers)
        @csv_row = csv_row
        @headers = headers
      end

      def method_missing(method_name, *_args)
        header = method_name.to_s
        i = headers.find_index(header)
        csv_row[i]
      end
    end

    def each(&block)
      csv_contents.map { |row| CsvRow.new(row, headers) }.each(&block)
    end
  end
end

# no inheritance! You can mix it in.
class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts row.Foo }
