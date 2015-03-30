require 'quick_mem/gc_constants'

module QuickMem
  class MemoryStats

    def self.show
      raw_data = GC.stat
      stats = {}
      gc_counts(stats, raw_data)
      heap_statistics(stats, raw_data)
      stats
    end

    class << self
      private

      def heap_statistics(stats, raw_data)
        stats[:heap_reserved] = raw_data[:heap_length] * page_size
        stats[:heap_allocated] = total_slots(raw_data) * slot_size
        stats[:heap_used] = used_slots(raw_data) * slot_size
        stats[:heap_free] = raw_data[:heap_free_slot] * slot_size
      end

      def gc_counts(stats, raw_data)
        stats[:major_gc_count] = raw_data[:major_gc_count]
        stats[:minor_gc_count] = raw_data[:minor_gc_count]
        stats[:total_gc_count] = raw_data[:count]
      end

      def total_slots(raw_data)
        used_slots(raw_data) + raw_data[:heap_free_slot]
      end

      def used_slots(raw_data)
        raw_data[:heap_live_slot] + raw_data[:heap_final_slot]
      end

      def page_size
        slot_size * slots_per_page
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
