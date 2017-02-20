    $ClusterRole_Name = "MSMQtest"
    $env:computername = $ClusterRole_Name
    $env:_Cluster_Network_Hostname_ = $ClusterRole_Name
    $env:_Cluster_Network_Name_ = $ClusterRole_Name

    Get-MsmqQueue | Get-MsmqQueueACL