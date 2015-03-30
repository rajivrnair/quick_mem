require 'spec_helper'
require 'quick_mem/dumps'

module QuickMem
  describe Dumps do
    describe '#top_allocated_objects' do
      subject { Dumps.top_allocated_objects }

      it 'returns a hash' do
        expect(subject).to be_a Hash
      end

      it 'has no more than fifty entries' do
        expect(subject.size).to be <= 50
      end

      it 'is sorted in descending order of size' do
        # Can't think of an easier way to do this :(
        expected_result = subject.values.sort.reverse
        expect(subject.values).to eql(expected_result)
      end
    end

    describe '#count_top_allocated_objects' do
      subject { Dumps.count_top_allocated_objects }

      it 'returns a hash' do
        expect(subject).to be_a Hash
      end

      it 'has no more than fifty entries' do
        expect(subject.size).to be <= 50
      end

      it 'is sorted in descending order of object count' do
        # Can't think of an easier way to do this :(
        expected_result = subject.values.sort.reverse
        expect(subject.values).to eql(expected_result)
      end
    end
  end
end
