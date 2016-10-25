module Qubole::Commands
  describe Shell do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::Shell.new
        command.command_type = 'ShellCommand'
      end
    end    
  end
end
