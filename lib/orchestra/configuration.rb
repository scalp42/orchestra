module Orchestra
  class Configuration
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def play_partition!
      load_partition!

      run_tasks
    end

    def run_tasks
      config[:tasks].each do |task_name|
        @tasks[task_name.to_sym].call if @tasks[task_name.to_sym]
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

    def load_partition!
      return if @loaded

      instance_eval(File.read(config[:partition]))
      @loaded = true
    end
  end
end