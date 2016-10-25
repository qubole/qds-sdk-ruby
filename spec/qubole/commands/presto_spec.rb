module Qubole::Commands
  describe Presto do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::Presto.new
        command.command_type = 'PrestoCommand'
      end
    end    
  end
end
