#MSMQ_Config

$Cluster_Name = "genmsq01s01"
$ClusterRole_Name = "MSMQtest"
$NetworkRole1 = "192.168.2.16"
$NetworkRole2 = "192.168.3.16"
$Role_Storage = "Cluster Disk 2"

Add-ClusterServerRole -Name $ClusterRole_Name -cluster $Cluster_Name -StaticAddress $NetworkRole1,$NetworkRole2 -Storage $Role_Storage

Add-ClusterResource -Name "MSMQ-$ClusterRole_Name" -ResourceType "MSMQ" -Group $ClusterRole_Name
Add-ClusterResource -Name "MSMQTriggers-$ClusterRole_Name" -ResourceType "MSMQTriggers" -Group $ClusterRole_Name

Set-ClusterResourceDependency $ClusterRole_Name  "[IP Address $NetworkRole1] or [IP Address $NetworkRole2]"
Set-ClusterResourceDependency MSMQ-$ClusterRole_Name  "([$ClusterRole_Name]) and ([$Role_Storage])"
Set-ClusterResourceDependency MSMQTriggers-$ClusterRole_Name   "([MSMQ-$ClusterRole_Name]) and ([$ClusterRole_Name])"

Start-ClusterGroup -name $ClusterRole_Name -Cluster $Cluster_Name