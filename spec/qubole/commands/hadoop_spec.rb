module Qubole::Commands
  describe Hadoop do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::Hadoop.new
        command.command_type = 'HadoopCommand'
      end
    end    
  end
end
