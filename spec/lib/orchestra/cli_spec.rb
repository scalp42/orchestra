require 'orchestra'
require 'orchestra/cli'

describe Orchestra::CLI do
  subject { Orchestra::CLI.new }

  describe "#execute" do
    it "calls parse_options" do
      subject.stub(:play_partition!)
      subject.should_receive(:parse_options)

      subject.execute
    end

    it "calls play_partition!" do
      subject.stub(:parse_options)
      subject.should_receive(:play_partition!)

      subject.execute
    end
  end

  describe "#set_tasks" do
    it "adds tasks" do
      subject.send(:set_tasks, ['method1', 'method2', 'method3'])
      subject.config[:tasks].should == ['method1', 'method2', 'method3']
    end

    it "adds on the config" do
      subject.config[:tasks] = ['previous_method']
      subject.send(:set_tasks, ['method1'])

      subject.config[:tasks].should == ['previous_method', 'method1']
    end

    it "uses the ARGV by default" do
      ARGV << 'method'
      subject.send(:set_tasks)
      subject.config[:tasks].should == ['method']
    end
  end
end