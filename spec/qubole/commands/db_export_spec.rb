module Qubole::Commands
  describe DbExport do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::DbExport.new
        command.command_type = 'DbExportCommand'
      end
    end    
  end
end
