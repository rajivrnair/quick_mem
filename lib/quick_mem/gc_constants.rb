module QuickMem
  class GCConstants

    def self.slot_size
      @@rvalue_size ||= GC::INTERNAL_CONSTANTS[:RVALUE_SIZE]
    end

    def self.slots_per_page
      @@heap_obj_limit ||= GC::INTERNAL_CONSTANTS[:HEAP_OBJ_LIMIT]
    end

  end
end
