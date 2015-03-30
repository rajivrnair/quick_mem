require 'quick_mem/memory_stats'
require 'quick_mem/summary'
require 'quick_mem/dumps'

module QuickMem
  class QuickMemory

    def self.version
      QuickMem::VERSION
    end

    def self.show_config
      add_meta_info(QuickMem::MemoryStats.show)
    end

    def self.show_summary
      add_meta_info(QuickMem::Summary.new(show_config).show)
    end

    def self.view_objects_by_size
      add_meta_info(objects_by_size: QuickMem::Dumps.top_allocated_objects)
    end

    def self.view_objects_by_count
      add_meta_info(objects_by_count: QuickMem::Dumps.count_top_allocated_objects)
    end

    class << self
      private

      def add_meta_info(a_hash)
        a_hash[:version] = version
        a_hash[:timestamp] = Time.now.strftime('%d/%m/%Y %H:%M:%S')
        a_hash
      end
    end

  end
end
