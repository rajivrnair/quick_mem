require 'quick_mem/memory_stats'
require 'quick_mem/summary'
require 'quick_mem/dumps'

module QuickMem
  class QuickMemory

    def self.version
      QuickMem::VERSION
    end

    def self.show_config
      QuickMem::MemoryStats.show
    end

    def self.show_summary
      QuickMem::Summary.new(show_config).show
    end

    def self.view_objects_by_size
      QuickMem::Dumps.top_allocated_objects
    end

    def self.view_objects_by_count
      QuickMem::Dumps.count_top_allocated_objects
    end

  end
end
