module Qubole::Commands
  describe Spark do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::Spark.new
        command.command_type = 'SparkCommand'
      end
    end    
  end
end
