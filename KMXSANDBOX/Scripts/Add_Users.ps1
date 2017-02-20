# AddUsers.ps1

Function Add-Svc_account {
	Param(
		[Parameter(Mandatory=$true)] 
		$svc_account,
		[Parameter(Mandatory=$true)] 
		$Password	
	)#end Param


    If ($svc_account.Length -gt 20) {
        $SAM_account = $svc_account.substring(0,20)
    }
    Else {
        $SAM_account = $svc_account
    }

    New-ADUser -Name $svc_account `
        -SamAccountName  $SAM_account `
        -UserPrincipalName $svc_account@kmxsandbox.com `
        -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) `
        -PassThru | Enable-ADAccount
} 

Add-Svc_account "svcAPRDnaAutochk" "P@ssword2"
Add-Svc_account "svcAPRDNABlackbook" "P@ssword2"
Add-Svc_account "svcAPRDNANaaa" "P@ssword2"
Add-Svc_account "svcAPRDnaPriorUse" "P@ssword2"
Add-Svc_account "svcAPRDnaWarehous" "P@ssword2"
Add-Svc_account "svcWRSTasks" "P@ssword2"
Add-Svc_account "svcobwreport" "P@ssword2"