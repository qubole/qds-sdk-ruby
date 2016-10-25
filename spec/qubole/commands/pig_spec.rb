module Qubole::Commands
  describe Pig do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::Pig.new
        command.command_type = 'PigCommand'
      end
    end    
  end
end
