require 'spec_helper'

module QuickMem
  describe MemoryStats do
    describe '#show' do
      let(:mem_stats) do
        {
          count: 22,
          major_gc_count: 4,
          minor_gc_count: 18,

          heap_length: 237,
          heap_used: 226,
          heap_eden_page_length: 220,
          heap_tomb_page_length: 6,

          heap_final_slot: 21,
          heap_free_slot: 829,
          heap_live_slot: 91292,
          heap_swept_slot: 22651,
          heap_increment: 0,

          malloc_increase: 545344,
          malloc_limit: 16777216,
          oldmalloc_increase: 6406440,
          oldmalloc_limit: 16777216,

          old_object: 54719,
          old_object_limit: 56776,

          remembered_shady_object: 811,
          remembered_shady_object_limit: 758,

          total_allocated_object: 524356,
          total_freed_object: 433064
        }
      end

      before do
        # assuming default values for
        # GC::INTERNAL_CONSTANTS[:RVALUE_SIZE] = 40
        # GC::INTERNAL_CONSTANTS[:HEAP_OBJ_LIMIT] = 408
        allow(GC).to receive(:stat) { mem_stats }
      end

      subject { MemoryStats.show }

      it 'spits out the number of major GCs' do
        expect(subject[:major_gc_count]).to eq(4)
      end

      it 'spits out the number of minor GCs' do
        expect(subject[:minor_gc_count]).to eq(18)
      end

      it 'spits out the total number of GCs' do
        expect(subject[:total_gc_count]).to eq(22)
      end

      it 'spits out the max reserved heap in bytes' do
        expect(subject[:heap_reserved]).to eq(3867840)
      end

      it 'spits out the allocated heap in bytes' do
        expect(subject[:heap_allocated]).to eq(3685680)
      end

      it 'spits out the heap currently used in bytes' do
        expect(subject[:heap_used]).to eq(3652520)
      end

      it 'spits out the heap free in bytes' do
        expect(subject[:heap_free]).to eq(33160)
      end
    end
  end
end
