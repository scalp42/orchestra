module Orchestra
  class Configuration
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def play_partition!
      partition.play
    end

    private

    def partition
      @partition ||= Partition.new(config)
    end
  end
end