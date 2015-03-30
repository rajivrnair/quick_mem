require 'quick_mem/memory_stats'
require 'quick_mem/summary'

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

  end
end
