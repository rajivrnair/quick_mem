require 'spec_helper'

require 'quick_mem/quick_mem'

module QuickMem
  describe QuickMemory do

    describe '#version' do
    subject { QuickMemory.version }

      it 'outputs the correct version number' do
        expect(subject).to eq '0.0.1'
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

      # let(:gc_config) { { :major_gc_count => 4 } }

      before do
        allow(GC).to receive(:stat) { mem_options }
      end

      # it 'spits out the GC config' do
      #   expect(subject).to eq(gc_config)
      # end

      it 'spits out the number of major GCs' do
        expect(subject[:major_gc_count]).to eq(4)
      end

      it 'spits out the number of minor GCs' do
        expect(subject[:minor_gc_count]).to eq(18)
      end

      it 'spits out the total number of GCs' do
        expect(subject[:total_gc_count]).to eq(22)
      end

    end

    describe '#stats' do
      subject { QuickMemory.stats }

      it 'spits out the max heap size' do
      end

      it 'spits out the used heap size' do
      end

      it 'spits out the free heap size' do
      end

      it 'spits out objects ordered by size' do
      end

    end

  end
end
