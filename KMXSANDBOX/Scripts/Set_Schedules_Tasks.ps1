$Action = New-ScheduledTaskAction -Execute Calc
$Trigger = New-ScheduledTaskTrigger -At 12:00 -Once
Register-ClusteredScheduledTask -TaskName "CalcTask02" -TaskType AnyNode -Action $Action -Trigger $Trigger