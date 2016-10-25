module Qubole::Commands
  describe Composite do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::Composite.new
        command.command_type = 'CompositeCommand'
      end
    end    
  end
end
