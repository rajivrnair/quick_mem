require 'quick_mem/version'
require 'quick_mem/gc_constants'

module QuickMem
  class QuickMemory

    def self.version
      QuickMem::VERSION
    end

    def self.show_config
      gc_stat = GC.stat
      config = {}
      gc_counts(config, gc_stat)
      heap_statistics(config, gc_stat)
      config
    end

    class << self
      private

      def heap_statistics(config, gc_stat)
        page_size = slot_size * slots_per_page
        config[:heap_allocated] = gc_stat[:heap_length] * page_size
        config[:heap_used] = gc_stat[:heap_eden_page_length] * page_size
      end

      def gc_counts(config, gc_stat)
        config[:major_gc_count] = gc_stat[:major_gc_count]
        config[:minor_gc_count] = gc_stat[:minor_gc_count]
        config[:total_gc_count] = gc_stat[:count]
      end

      def slot_size
        QuickMem::GCConstants.slot_size
      end

      def slots_per_page
        QuickMem::GCConstants.slots_per_page
      end
    end

  end
end
