module Qubole::Commands
  describe Hive do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::Hive.new
        command.command_type = 'HiveCommand'
      end
    end    
  end
end
