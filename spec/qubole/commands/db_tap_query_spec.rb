module Qubole::Commands
  describe DbTapQuery do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::DbTapQuery.new
        command.command_type = 'DbTapQueryCommand'
      end
    end    
  end
end
