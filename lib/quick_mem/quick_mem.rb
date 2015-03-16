require 'quick_mem/version'

module QuickMem
  class QuickMemory

    def self.slot_size
      @@rvalue_size ||= GC::INTERNAL_CONSTANTS[:RVALUE_SIZE]
    end

    def self.version
      QuickMem::VERSION
    end

    def self.show_config
      gc_stat = GC.stat
      config = Hash.new
      set_gc_counts(config, gc_stat)
      config
    end

    private

    def self.set_gc_counts(config, gc_stat)
      config[:major_gc_count] = gc_stat[:major_gc_count]
      config[:minor_gc_count] = gc_stat[:minor_gc_count]
      config[:total_gc_count] = gc_stat[:count]
    end
  end
end
