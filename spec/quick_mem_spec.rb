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

      before do
        allow(QuickMem::MemoryStats).to receive(:show) do
          { total_gc_count: 20 }
        end
      end

      it 'returns a hash of memory statistics' do
        expect(subject).to be_a Hash
      end

      it 'is not empty' do
        expect(subject).not_to be_empty
      end

      it 'contains statistics about the current memory usage' do
        expect(subject[:total_gc_count]).to eql(20)
      end
    end
  end
end
