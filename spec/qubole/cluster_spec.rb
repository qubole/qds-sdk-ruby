module Qubole

  describe Cluster do

    before(:each) do
      Qubole.stub(:http) do |name, path, param|
        @request_type = name
        @url_path = path
        @p = param
      end
    end

    describe "Cluster list" do
      it "should return correct http arguments" do
        Cluster.list
        expect(@request_type).to eq("GET")
        expect(@url_path).to eq("/clusters")
        expect(@p).to eq({})
      end
    end

    describe "Show cluster details" do
      it "should return correct http arguments" do
        Cluster.show(1)
        expect(@request_type).to eq("GET")
        expect(@url_path).to eq("/clusters/1")
        expect(@p).to eq({})
      end
    end

    describe "Create cluster" do
      it "should return correct http arguments" do
        Cluster.create({"cluster"=>{:label => ["my_cluster"], "node_configuration" => {"slave_request_type"=>"spot", "initial_nodes"=>1,
                       "spot_instance_settings"=>{"timeout_for_request"=>10, "maximum_spot_instance_percentage"=>60,
                       "maximum_bid_price_percentage"=>"100.0"}, "max_nodes"=>10, "master_instance_type"=>"m1.large", "slave_instance_type"=>
                       "m1.xlarge"}, "hadoop_settings"=>{"use_hadoop2"=>false, "max_nodes"=>10, "fairscheduler_settings"=>{"default_pool"=>nil},
                       "custom_config"=>nil}, "enable_ganglia_monitoring"=>false, "state"=>"DOWN", "node_bootstrap_file"=>"node_bootstrap.sh",
                       "use_hadoop2"=>false, "security_settings"=>{"encrypted_ephemerals"=>false}, "ec2_settings"=>{"compute_validated"=>true,
                       "aws_region"=>"us-west-2", "aws_preferred_availability_zone"=>"Any", "compute_secret_key"=>"xxxx",
                       "vpc_id"=>nil, "compute_access_key"=>"xxxx", "subnet_id"=>nil}, "presto_settings"=>
                       {"enable_presto"=>false, "custom_config"=>nil}, "disallow_cluster_termination"=>false}})

        expect(@request_type).to eq("POST")
        expect(@url_path).to eq("/clusters")
        expect(@p).to eq({"cluster"=>{:label => ["my_cluster"], "node_configuration" => {"slave_request_type"=>"spot", "initial_nodes"=>1,
                         "spot_instance_settings"=>{"timeout_for_request"=>10, "maximum_spot_instance_percentage"=>60,
                         "maximum_bid_price_percentage"=>"100.0"}, "max_nodes"=>10, "master_instance_type"=>"m1.large", "slave_instance_type"=>
                         "m1.xlarge"}, "hadoop_settings"=>{"use_hadoop2"=>false, "max_nodes"=>10, "fairscheduler_settings"=>{"default_pool"=>nil},
                         "custom_config"=>nil}, "enable_ganglia_monitoring"=>false, "state"=>"DOWN", "node_bootstrap_file"=>"node_bootstrap.sh",
                         "use_hadoop2"=>false, "security_settings"=>{"encrypted_ephemerals"=>false}, "ec2_settings"=>{"compute_validated"=>true, "aws_region"=>"us-west-2", "aws_preferred_availability_zone"=>"Any", "compute_secret_key"=>"xxxx",
                         "vpc_id"=>nil, "compute_access_key"=>"xxxx", "subnet_id"=>nil}, "presto_settings"=>
                         {"enable_presto"=>false, "custom_config"=>nil}, "disallow_cluster_termination"=>false}})

      end
    end


    describe "Update cluster" do
      it "label should return correct http arguments" do
        Cluster.update(1, {'cluster' => { 'label' => ['test_label']}})
        expect(@request_type).to eq("PUT")
        expect(@url_path).to eq("/clusters/1")
        expect(@p).to eq({'cluster' => { 'label' => ['test_label']}})
      end
    end

    describe "Clone cluster" do
      it "with label should return correct http arguments" do
        Cluster.clone(1, {"cluster" => {"label" => ["test_label1", "test_label2"]}})
        expect(@request_type).to eq("POST")
        expect(@url_path).to eq("/clusters/1/clone")
        expect(@p).to eq({"cluster" => {"label" => ["test_label1", "test_label2"]}})
      end
    end

    describe "Start Cluster" do
      it "should return correct http arguments" do
        Cluster.start(1)
        expect(@request_type).to eq("PUT")
        expect(@url_path).to eq("/clusters/1/state")
        expect(@p).to eq({:state => "start"})
      end
    end

    describe "Status of cluster" do
      it "should return correct http arguments" do
        Cluster.status(1)
        expect(@request_type).to eq("GET")
        expect(@url_path).to eq("/clusters/1/state")
        expect(@p).to eq({})
      end
    end

    describe "Terminate Cluster" do
      it "should return correct http arguments" do
        Cluster.terminate(1)
        expect(@request_type).to eq("PUT")
        expect(@url_path).to eq("/clusters/1/state")
        expect(@p).to eq({:state => "terminate"})
      end
    end

    describe "Delete cluster" do
      it "should return correct http arguments" do
        Cluster.delete(1)
        expect(@request_type).to eq("DELETE")
        expect(@url_path).to eq("/clusters/1")
        expect(@p).to eq({})
      end
    end

    describe "Reassign label" do
      it "should return correct http arguments" do
        Cluster.reassign_label({'destination_cluster' => '123', 'label' => 'test_label'})
        expect(@request_type).to eq("PUT")
        expect(@url_path).to eq("/clusters/reassign-label")
        expect(@p).to eq({'destination_cluster' => '123', 'label' => 'test_label'})
      end
    end

    describe "Run script" do
      it "using s3 path should return correct http arguments" do
        Cluster.run_script(1, {"script" => "s3_path"})
        expect(@request_type).to eq("PUT")
        expect(@url_path).to eq("/clusters/1/runscript.json")
        expect(@p).to eq({"script" => "s3_path"})
      end
    end

    describe "Cluster metrics" do
      it "should return correct http arguments" do
        Cluster.metrics(1, {:metric => "mapred.jobtracker.maps_launched", :hostname => "master", :interval => "hour"})
        expect(@request_type).to eq("GET")
        expect(@url_path).to eq("/clusters/1/metrics")
        expect(@p).to eq({:metric => "mapred.jobtracker.maps_launched", :hostname => "master", :interval => "hour"})
      end
    end

    describe "Resize cluster" do
      it "should return correct http arguments" do
        Cluster.resize(1, {"node_configuration" => {"initial_nodes" => "3"}, "push" => "true"})
        expect(@request_type).to eq("PUT")
        expect(@url_path).to eq("/clusters/1")
        expect(@p).to eq({"node_configuration" => {"initial_nodes" => "3"}, "push" => "true"})
      end
    end

    describe "Add node to cluster" do
      it "should return correct http arguments" do
        Cluster.add_node(1, {"node_count" => "2"})
        expect(@request_type).to eq("POST")
        expect(@url_path).to eq("/clusters/1/nodes")
        expect(@p).to eq({"node_count" => "2"})
      end
    end

    describe "Replace node" do
      it "should return correct http arguments" do
        Cluster.replace_node(1, { "private_dns" => "ip-address"})
        expect(@request_type).to eq("PUT")
        expect(@url_path).to eq("/clusters/1/nodes")
        expect(@p).to eq({ "private_dns" => "ip-address", "command" => "replace"})
      end
    end

    describe "Remove node" do
      it "should return correct http arguments" do
        Cluster.remove_node(1, {"private_dns" => "ip-address"})
        expect(@request_type).to eq("DELETE")
        expect(@url_path).to eq("/clusters/1/nodes")
        expect(@p).to eq({"private_dns" => "ip-address"})
      end
    end

    describe "Create Hbase Snapshot" do
      it "with no back up type should return correct http arguments" do
        Cluster.snapshot(1, {"s3_location" => "s3-path"})
        expect(@request_type).to eq("POST")
        expect(@url_path).to eq("/clusters/1/snapshots")
        expect(@p).to eq({"s3_location" => "s3-path"})
      end
    end

    describe "Get snapshot schedule" do
      it "should return correct http arguments" do
        Cluster.get_snapshot_schedule(1)
        expect(@request_type).to eq("GET")
        expect(@url_path).to eq("/clusters/1/snapshot_schedule")
        expect(@p).to eq({})
      end
    end

    describe "Restore point" do
      it "should return correct http arguments" do
        Cluster.restore_point(1, { "table_names" => "test", "backup_id" => "abcd", "automatic" => true,
          "overwrite" => true, "s3_location" => "s3-path" })
        expect(@request_type).to eq("POST")
        expect(@url_path).to eq("/clusters/1/restore_point")
        expect(@p).to eq({ "table_names" => "test", "backup_id" => "abcd", "automatic" => true,
                           "overwrite" => true, "s3_location" => "s3-path" })

      end
    end

    describe "Update snapshot schedule" do
      it "should return correct http arguments" do
        Cluster.update_snapshot_schedule(1, {"snapshot-schedule" => { "frequency_unit" => "hours",
                                        "frequency_num" => 20, "s3_location" => "s3-path"}})
        expect(@request_type).to eq("PUT")
        expect(@url_path).to eq("/clusters/1/snapshot_schedule")
        expect(@p).to eq({"snapshot-schedule" => { "frequency_unit" => "hours",
                         "frequency_num" => 20, "s3_location" => "s3-path"}})

      end
    end

  end
end