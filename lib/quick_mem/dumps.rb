require 'objspace'

module QuickMem
  class Dumps

    def self.top_allocated_objects
      objects_by_size = Hash.new { 0 }
      ObjectSpace.each_object do |obj|
        objects_by_size[obj.class] += ObjectSpace.memsize_of(obj)
      end
      get_top_50(objects_by_size)
    end

    def self.count_top_allocated_objects
      objects_by_count = Hash.new { 0 }
      ObjectSpace.each_object do |obj|
        objects_by_count[obj.class] += 1
      end
      get_top_50(objects_by_count)
    end

    class << self
      private

      def get_top_50(a_hash)
        a_hash.sort_by(&:last).reverse![0..49].to_h
      end
    end

  end
end
