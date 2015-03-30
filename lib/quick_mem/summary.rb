require 'quick_mem/gc_constants'

module QuickMem
  class Summary

    NUMBER_FORMAT = '%.2f'

    def initialize(raw_data)
      @summary = {}
      @stats = raw_data
      calculate_heap_summary
      calculate_percentage_used
    end

    def show
      summary
    end

    private

    def calculate_heap_summary
      summary[:heap_reserved] = pretty_bytes_to_megabytes(stats[:heap_reserved])
      summary[:heap_allocated] = pretty_bytes_to_megabytes(stats[:heap_allocated])
      summary[:heap_used] = pretty_bytes_to_megabytes(stats[:heap_used])
      summary[:heap_free] = pretty_bytes_to_megabytes(stats[:heap_free])
    end

    def calculate_percentage_used
      summary[:heap_used_pct] = percentage_of(stats[:heap_used], stats[:heap_allocated])
      summary[:heap_free_pct] = percentage_of(stats[:heap_free], stats[:heap_allocated])
    end

    def pretty_bytes_to_megabytes(bytes)
      NUMBER_FORMAT % bytes_to_megabytes(bytes)
    end

    def percentage_of(size, total)
      NUMBER_FORMAT % ((bytes_to_megabytes(size) / bytes_to_megabytes(total)) * 100.00)
    end

    def bytes_to_megabytes(bytes)
      bytes / (1024.0 * 1024.0)
    end

    attr_reader :summary, :stats

  end
end
