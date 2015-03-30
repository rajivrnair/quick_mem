require 'quick_mem/memory_stats'

module QuickMem
  class QuickMemory

    def self.version
      QuickMem::VERSION
    end

    def self.show_config
      QuickMem::MemoryStats.show
    end

  end
end
