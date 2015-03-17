require 'quick_mem/version'
require 'quick_mem/gc_constants'

module QuickMem
  class QuickMemory

    def self.version
      QuickMem::VERSION
    end

    def self.show_config
      gc_stat = GC.stat
      config = Hash.new
      gc_counts(config, gc_stat)
      heap_statistics(config, gc_stat)
      config
    end

    private

    def self.heap_statistics(config, gc_stat)
      config[:heap_allocated] = gc_stat[:heap_length] * slot_size * slots_per_page
      config[:heap_used] = gc_stat[:heap_eden_page_length] * slot_size * slots_per_page
    end

    def self.gc_counts(config, gc_stat)
      config[:major_gc_count] = gc_stat[:major_gc_count]
      config[:minor_gc_count] = gc_stat[:minor_gc_count]
      config[:total_gc_count] = gc_stat[:count]
    end

    def self.slot_size
      QuickMem::GCConstants.slot_size
    end

    def self.slots_per_page
      QuickMem::GCConstants.slots_per_page
    end

  end
end
