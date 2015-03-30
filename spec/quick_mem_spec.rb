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

      it 'returns a hash' do
        expect(subject).to be_a Hash
      end

      it 'is not empty' do
        expect(subject).not_to be_empty
      end

      it 'contains statistics about the current memory usage' do
        expect(subject[:total_gc_count]).to eql(20)
      end
    end

    describe '#show_summary' do
      subject { QuickMemory.show_summary }
      let(:summary) { double('summary') }

      before do
        allow(QuickMem::Summary).to receive(:new) { summary }
        allow(summary).to receive(:show) { { heap_used_pct: '50.55' } }
      end

      it 'returns a hash' do
        expect(subject).to be_a Hash
      end

      it 'is not empty' do
        expect(subject).not_to be_empty
      end

      it 'contains a summary about the current memory usage' do
        expect(subject[:heap_used_pct]).to eql('50.55')
      end
    end
  end
end
