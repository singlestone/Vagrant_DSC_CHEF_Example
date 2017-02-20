#Add_Queue

Function Add-MsmqQueue {

	Param(
		[Parameter(Mandatory=$true)] 
		$ClusterRole_Name,
		[Parameter(Mandatory=$true)] 
		$MsmqQueue_Name,		
		[Parameter(Mandatory=$true)] 
		$MsmqQueue_Label,
		[Parameter(Mandatory=$true)] 
		$MsmqQueue_svcAccount		
	)#end Param

    $env:computername = $ClusterRole_Name
    $env:_Cluster_Network_Hostname_ = $ClusterRole_Name
    $env:_Cluster_Network_Name_ = $ClusterRole_Name

    New-MsmqQueue `
                -Name $MsmqQueue_Name `
                -Label $MsmqQueue_Label `
                -QueueType Private `
                -Transactional
				
    $ACLqueue = Get-MsmqQueue    –Name     $MsmqQueue_Name             -QueueType Private
#    $ACLqueue | Set-MsmqQueueACL -UserName $MsmqQueue_svcAccount       -Allow PeekMessage
#    $ACLqueue | Set-MsmqQueueACL -UserName $MsmqQueue_svcAccount       -Allow ReceiveMessage
#    $ACLqueue | Set-MsmqQueueACL -UserName $MsmqQueue_svcAccount       -Allow WriteMessage
#    $ACLqueue | Set-MsmqQueueACL -UserName $MsmqQueue_svcAccount       -Allow TakeQueueOwnership
    $ACLqueue | Set-MsmqQueueACL -UserName "kmxsandbox\administrator"  -Allow TakeQueueOwnership
}




Add-MsmqQueue "MSMQtest" "merchandisingvindnaautocheck/v1/autocheckhtml.svc"					"private$\merchandisingvindnaautocheck/v1/AutocheckHtml.svc"  				"KMXSANDBOX\svcAPRDnaAutochk"
Add-MsmqQueue "MSMQtest" "merchandisingvindnaautocheck/v1/autocheckxml.svc"            			"private$\merchandisingvindnaautocheck/v1/AutocheckXml.svc"  				"KMXSANDBOX\svcAPRDnaAutochk"
Add-MsmqQueue "MSMQtest" "merchandisingvindnaautocheck/v1/nmvtishtml.svc"              			"private$\merchandisingvindnaautocheck/v1/nmvtishtml.svc"  					"KMXSANDBOX\svcAPRDnaAutochk"
Add-MsmqQueue "MSMQtest" "merchandisingvindnaautocheck/v1/nmvtisxml.svc"               			"private$\merchandisingvindnaautocheck/v1/nmvtisxml.svc"					"KMXSANDBOX\svcAPRDnaAutochk"
 #Add-MsmqQueue "MSMQtest" "merchandisingvindnaautocheck/v1/vindnaworker.svc/deadletter" 	    "private$\MerchandisingVinDnaAutocheck/v1/VinDnaWorker.svc/deadletter"      "KMXSANDBOX\ADMINISTRATOR"
Add-MsmqQueue "MSMQtest" "merchandisingvindnablackbook/v1/blackbook.svc"               			"private$\MerchandisingVinDnaBlackBook/v1/BlackBook.svc"  					"KMXSANDBOX\svcAPRDNABlackbook"
Add-MsmqQueue "MSMQtest" "merchandisingvindnablackbook/v1/blackbookvalues.svc"         		    "private$\MerchandisingVinDnaBlackBook/v1/BlackBookValues.svc"				"KMXSANDBOX\svcAPRDNABlackbook"
Add-MsmqQueue "MSMQtest" "merchandisingvindnanaaa/v1/naaa.svc"                         			"private$\MerchandisingVinDnaNaaa/v1/Naaa.svc"								"KMXSANDBOX\svcAPRDNANaaa"
Add-MsmqQueue "MSMQtest" "merchandisingvindnaprioruse/v1/vindnaworker.svc"             			"private$\MerchandisingVinDnaPriorUse/v1/VinDnaWorker.svc"					"KMXSANDBOX\svcAPRDnaPriorUse"
  #Add-MsmqQueue "MSMQtest" "merchandisingvindnaprioruse/v1/vindnaworker.svc/deadletter"  		"private$\MerchandisingVinDnaPriorUse/v1/VinDnaWorker.svc/deadletter"	  	"KMXSANDBOX\ADMINISTRATOR"
Add-MsmqQueue "MSMQtest" "merchandisingwarehouse/v1/appraisalhistory.svc"              			"private$\MerchandisingVinDnaWarehouse/v1/AppraisalHistory.svc"			  	"KMXSANDBOX\svcAPRDnaWarehous"
Add-MsmqQueue "MSMQtest" "merchandisingwarehouse/v1/retailhistory.svc"                 			"private$\MerchandisingVinDnaWarehouse/v1/RetailHistory.svc"				"KMXSANDBOX\svcAPRDnaWarehous"
Add-MsmqQueue "MSMQtest" "merchandisingwarehouse/v1/servicehistory.svc"	               			"private$\merchandisingvindnawarehouse/v1/servicehistory.svc"	  			"KMXSANDBOX\svcAPRDnaWarehous"
Add-MsmqQueue "MSMQtest" "merchandisingwarehouse/v1/wholesalesaleshistory.svc"         			"private$\MerchandisingVinDnaWarehouse/v1/WholesaleSalesHistory.svc"    	"KMXSANDBOX\svcAPRDnaWarehous"
Add-MsmqQueue "MSMQtest" "merchandisingwholesaletasks/v1/dealerintegration.svc"        			"private$\merchandisingwholesaletasks/v1/dealerintegration.svc"				"KMXSANDBOX\svcAPRDnaWarehous"
Add-MsmqQueue "MSMQtest" "merchandisingwholesaletasks/v1/filenetmigrator.svc"          			"private$\merchandisingwholesaletasks/v1/filenetmigrator.svc"				"KMXSANDBOX\svcWRSTasks"
Add-MsmqQueue "MSMQtest" "obwreportgeneratorservice/reportgenerator.svc"               			"private$\ObwReportGeneratorService/ReportGenerator.svc"					"KMXSANDBOX\svcobwreport"
#Add-MsmqQueue "MSMQtest" "obwreportservice/reportgeneratordeadletterqueue"             			"private$\ObwReportService/ReportGeneratorDeadLetterQueue"				  	"KMXSANDBOX\svcobwreport"