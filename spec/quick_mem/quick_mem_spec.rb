require 'spec_helper'

require 'quick_mem'

module QuickMem
  describe QuickMemory do

    describe '#version' do
    subject { QuickMemory.version }

      it 'outputs the correct version number' do
        expect(subject).to eq '0.0.3'
      end
    end

    describe '#show_config' do
      subject { QuickMemory.show_config }
      let(:mem_options) {
        {
          count: 22,
          heap_eden_page_length: 226,
          heap_final_slot: 0,
          heap_free_slot: 829,
          heap_increment: 0,
          heap_length: 237,
          heap_live_slot: 91292,
          heap_swept_slot: 22651,
          heap_tomb_page_length: 0,
          heap_used: 226,
          major_gc_count: 4,
          malloc_increase: 545344,
          malloc_limit: 16777216,
          minor_gc_count: 18,
          old_object: 54719,
          old_object_limit: 56776,
          oldmalloc_increase: 6406440,
          oldmalloc_limit: 16777216,
          remembered_shady_object: 811,
          remembered_shady_object_limit: 758,
          total_allocated_object: 524356,
          total_freed_object: 433064
        }
      }

      before do
        # assuming default values for
        # GC::INTERNAL_CONSTANTS[:RVALUE_SIZE] = 40
        # GC::INTERNAL_CONSTANTS[:HEAP_OBJ_LIMIT] = 408

        allow(GC).to receive(:stat) { mem_options }
      end

      it 'spits out the number of major GCs' do
        expect(subject[:major_gc_count]).to eq(4)
      end

      it 'spits out the number of minor GCs' do
        expect(subject[:minor_gc_count]).to eq(18)
      end

      it 'spits out the total number of GCs' do
        expect(subject[:total_gc_count]).to eq(22)
      end

      it 'spits out the total heap allocated in bytes' do
        expect(subject[:heap_allocated]).to eq(3867840)
      end

      it 'spits out the heap used in bytes' do
        expect(subject[:heap_used]).to eq(3688320)
      end

    end

  end
end
