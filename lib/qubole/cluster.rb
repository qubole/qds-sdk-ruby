module Qubole

  # To look for what all parameters need to be passed go to http://docs.qubole.com/en/latest/rest-api/cluster_api/
  # Pass the params as hash from above doc link
  class Cluster

    # List existing clusters present in your account.
    def self.list
      Qubole.get("/clusters")
    end

    # Show information about the cluster with id/label `cluster_id_label`.
    def self.show(cluster_id_label)
      Qubole.get("/clusters/#{cluster_id_label}")
    end

    # Create a new cluster
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/create-new-cluster.html
    def self.create(params={})
     Qubole.post("/clusters", params)
    end

    # Update the cluster with id/label `cluster_id_label` using information provided in `cluster_info`.
    # Assign id/label of cluster to id
    def self.update(id, params={})
      Qubole.put("/clusters/#{id}", params)
    end

    # Clone the cluster with id/label `cluster_id_label` using information provided in `cluster_info`.
    # Assign id/label of cluster to id
    def self.clone(id, params={})
      Qubole.post("/clusters/#{id}/clone", params)
    end

    # Start the cluster with id/label.
    def self.start(id)
      params = {}
      params[:state] = "start"
      Qubole.put("/clusters/#{id}/state", {:state => "start"})
    end

    # Show the status of the cluster with id/label.
    def self.status(id)
      Qubole.get("/clusters/#{id}/state")
    end

    # Terminate the cluster with id/label `cluster_id_label`.
    def self.terminate(id)
      Qubole.put("/clusters/#{id}/state", {:state => "terminate"})
    end

    # Delete the cluster with id/label.
    def self.delete(id)
      Qubole.delete("/clusters/#{id}")
    end

    # Reassign a label from one cluster to another.
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/reassign-cluster-label.html#parameters
    def self.reassign_label(params={})
      Qubole.put("/clusters/reassign-label", params)
    end

    # Run an adhoc script
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/run-adhoc-scripts-cluster.html
    # Assign id/label of cluster to id.
    def self.run_script(id, params={})
      Qubole.put("/clusters/#{id}/runscript.json", params)
    end

    # To look for cluster metrics
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/metrics-cluster.html
    # Assign id/label of cluster to id.
    def self.metrics(id, params={})
      Qubole.get("/clusters/#{id}/metrics", params)
    end

    # To change the minimum and maximum size of a running cluster
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/resize-cluster.html
    # Assign id/label of cluster to id.
    def self.resize(id, params={})
      Qubole.put("/clusters/#{id}",params)
    end

    # Add a node to an existing cluster
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/add-node.html
    # Assign id/label of cluster to id.
    def self.add_node(id, params={})
      Qubole.post("/clusters/#{id}/nodes", params)
    end

    # Replaces a slave node in a cluster
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/replace-node.html
    # Assign id/label of cluster to id.
    def self.replace_node(id, params={})
      params["command"] = "replace"
      Qubole.put("/clusters/#{id}/nodes", params)
    end

    # Removes a slave node from a cluster
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/remove-node.html#parameters
    # Assign id/label of cluster to id
    def self.remove_node(id, params={})
      Qubole.delete("/clusters/#{id}/nodes", params)
    end

    # Create hbase snapshot full/incremental
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/hbase-snapshot.html#parameters
    # Assign id/label of cluster to id
    def self.snapshot(id, params={})
      Qubole.post("/clusters/#{id}/snapshots", params)
    end

    # Get details for snapshot schedule
    def self.get_snapshot_schedule(id)
      Qubole.get("/clusters/#{id}/snapshot_schedule")
    end

    # Restoring cluster from a given hbase snapshot id
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/restore-point.html#parameters
    # Assign id/label of cluster to id
    def self.restore_point(id, params={})
      Qubole.post("/clusters/#{id}/restore_point", params)
    end

    # Update for snapshot schedule
    # http://docs.qubole.com/en/latest/rest-api/cluster_api/update-snapshot-schedule.html#parameters
    # Assign id/label of cluster to id
    def self.update_snapshot_schedule(id, params={})
      Qubole.put("/clusters/#{id}/snapshot_schedule", params)
    end

  end

end
