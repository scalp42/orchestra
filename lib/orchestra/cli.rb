require 'mixlib/cli'
require 'ruby-debug'

module Orchestra
  class CLI
    include ::Mixlib::CLI

    option :parallel,
            :short => "-P",
            :long => "--parallel",
            :boolean => true,
            :required => false,
            :description => "Use concurrent connections for SSH"

    option :hosts,
            :short => "-H HOSTS",
            :long => "--host HOSTS",
            :required => false,
            :description => "Speciify by hand the hosts to run Orchestra on. Take over any other configurations.",
            :proc => Proc.new { |l| l.split(',') }

    option :partition,
            :short => "-f PARTITION",
            :long => "--file PARTITION",
            :default => 'partition.rb',
            :required => false,
            :description => "File to read for the task(s) to be executed."

    def execute
      $stdout.sync = true
      parse_options

      play_partition!
    end

    private

    def set_tasks(args = ARGV)
      config[:tasks] ||= []
      args.each do |arg|
        break if arg =~ /^-/
        config[:tasks] << arg
      end
      config[:tasks]
    end

    def parse_options
      super
      set_tasks
    end

    def play_partition!
      orchestra_configuration.play_partition!
    end

    def orchestra_configuration
      @orchestra_configuration ||= ::Orchestra::Configuration.new(config)
    end
  end
end
