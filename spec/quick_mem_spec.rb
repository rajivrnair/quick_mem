require 'spec_helper'

require 'quick_mem'

module QuickMem
  describe QuickMemory do
    let(:version) { '0.0.5' }
    let(:time_now) { double('time') }
    let(:timestamp) { '30/03/2015 23:28:47' }

    before do
      allow(Time).to receive(:now) { time_now }
      allow(time_now).to receive(:strftime) { timestamp }
    end

    describe '#version' do
      subject { QuickMemory.version }

      it 'outputs the correct version number' do
        expect(subject).to eq version
      end
    end

    describe '#show_stats' do
      subject { QuickMemory.show_stats }

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

      it 'contains the version' do
        expect(subject[:version]).to eq version
      end

      it 'contains the timestamp' do
        expect(subject[:timestamp]).to eq timestamp
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

      it 'contains the version' do
        expect(subject[:version]).to eq version
      end

      it 'contains the timestamp' do
        expect(subject[:timestamp]).to eq timestamp
      end
    end

    describe '#view_objects_by_size' do
      subject { QuickMemory.view_objects_by_size }

      before do
        allow(QuickMem::Dumps).to receive(:top_allocated_objects) do
          { Thread: 1049960, String: 2688465, Class: 976088 }
        end
      end

      it 'returns a hash' do
        expect(subject).to be_a Hash
      end

      it 'is not empty' do
        expect(subject).not_to be_empty
      end

      it 'contains a map of classes to total size of all instances' do
        expect(subject[:objects_by_size]).to eql(String: 2688465, Thread: 1049960, Class: 976088)
      end

      it 'contains the version' do
        expect(subject[:version]).to eq version
      end

      it 'contains the timestamp' do
        expect(subject[:timestamp]).to eq timestamp
      end
    end

    describe '#view_objects_by_count' do
      subject { QuickMemory.view_objects_by_count }

      before do
        allow(QuickMem::Dumps).to receive(:count_top_allocated_objects) do
          { Thread: 104, String: 268, Class: 97 }
        end
      end

      it 'returns a hash' do
        expect(subject).to be_a Hash
      end

      it 'is not empty' do
        expect(subject).not_to be_empty
      end

      it 'contains a map of classes to instance count' do
        expect(subject[:objects_by_count]).to eql(String: 268, Thread: 104, Class: 97)
      end

      it 'contains the version' do
        expect(subject[:version]).to eq version
      end

      it 'contains the timestamp' do
        expect(subject[:timestamp]).to eq timestamp
      end
    end
  end
end
