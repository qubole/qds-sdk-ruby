module Qubole
  describe Command do
    subject { Command.new(id: 1) }

    describe "::page" do
      it "returns array of commands" do
        attrs = {id: 1, name: 'Fake'}
        expect(Qubole).to receive(:get).with("/commands", {page: 1, per_page: 10}).and_return('commands' => [attrs])
        expect(Command.page(1)).to eq([Qubole::Command.new(attrs)])
      end
    end

    describe "::find" do
      it "returns command by id" do
        attrs = {id: 1, name: 'Fake'}
        expect(Qubole).to receive(:get).with("/commands/1").and_return(attrs)
        expect(Command.find(1)).to eq(Qubole::Command.new(attrs))
      end
    end

    describe "#parse" do
      it "updates command attributes" do
        subject.parse(id: 2, name: 'Fake')
        expect(subject.id).to eq(2)
        expect(subject.name).to eq('Fake')
      end
    end

    describe "#submit" do
      it "sends command to Qubole and updates attributes" do
        expect(Qubole).to receive(:post).with("/commands", id: 1, query:"SHOW TABLES", label: "custom cluster").and_return(id: 10, status: 'waiting')
        subject.submit(query: "SHOW TABLES", label: "custom cluster")
        expect(subject.id).to eq(10)
        expect(subject.status).to eq('waiting')
      end
    end

    describe "#refresh!" do
      it "refreshes command attributes" do
        expect(Qubole).to receive(:get).with("/commands/1").and_return(status: 'waiting')
        subject.refresh!
        expect(subject.status).to eq('waiting')
      end
    end

    describe "#results" do
      it "fetches results from Qubole" do
        results = {"results"=>"data", "inline"=>true}
        expect(Qubole).to receive(:get).with("/commands/1/results").and_return(results)
        expect(subject.results).to eq(results)
      end
    end

    describe "#logs" do
      it "fetches logs from Qubole" do
        logs = "some logs"
        expect(Qubole).to receive(:get).with("/commands/1/logs").and_return(logs)
        expect(subject.logs).to eq(logs)
      end
    end

    describe "#jobs" do
      it "fetches Hadoop jobs spawned by command" do
        jobs = [{"job_id"=>"job_2588.201506291819_0018"}]
        expect(Qubole).to receive(:get).with("/commands/1/jobs").and_return(jobs)
        expect(subject.jobs).to eq(jobs)
      end
    end

    describe "#cancel" do
      it "cancels command execution" do
        expect(Qubole).to receive(:put).with("/commands/1")
        subject.cancel
      end
    end
  end
end
