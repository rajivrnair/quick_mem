require 'spec_helper'
require 'quick_mem/summary'

module QuickMem
  describe Summary do
    describe '#show' do
      let(:mem_stats) do
        {
          heap_reserved: 204000000,
          heap_allocated: 40800000,
          heap_used: 32640000,
          heap_free: 8160000
        }
      end
      subject { Summary.new(mem_stats).show }

      it 'returns a summary of the memory usage' do
        expect(subject).to be_a Hash
        expect(subject).not_to be_empty
      end

      it 'displays the total memory reserved by the rvm in mb' do
        expect(subject[:heap_reserved]).to eql('194.55')
      end

      it 'displays the memory currently allocated in mb' do
        expect(subject[:heap_allocated]).to eql('38.91')
      end

      it 'displays the memory currently used in mb' do
        expect(subject[:heap_used]).to eql('31.13')
      end

      it 'displays the memory currently used as a percentage of allocated memory' do
        expect(subject[:heap_used_pct]).to eql('80.00')
      end

      it 'displays the memory currently free in mb' do
        expect(subject[:heap_free]).to eql('7.78')
      end

      it 'displays the memory currently free as a percentage of allocated memory' do
        expect(subject[:heap_free_pct]).to eql('20.00')
      end
    end
  end
end
