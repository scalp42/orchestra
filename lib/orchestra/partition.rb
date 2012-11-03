module Orchestra
  class Partition
    include Command

    attr_reader :config

    def initialize(config)
      @config = config.dup
      load
      add_tasks
    end

    def play
      config[:tasks].each do |task_name|
        send(task_name)
      end
    end

    def add_tasks
      singleton = class << self; self end
      @tasks.each do |method_name, method|
        singleton.send :define_method, method_name, method
      end
    end

    def run
      Net::SSH.start(host, user, :password => "password") do |ssh|

      end
    end

    private

    def set(variable_name, value)
      @variables ||= {}
      @variables[variable_name] = value
    end

    def task(task_name, &block)
      @tasks ||= {}
      @tasks[task_name.to_sym] = block
    end

    def load
      return if @loaded

      instance_eval(File.read(config[:partition]))
      @loaded = true
    end
  end
end
