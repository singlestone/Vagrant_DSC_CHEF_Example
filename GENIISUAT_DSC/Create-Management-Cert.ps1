#Create Management Cert

$cert = `
    New-SelfSignedCertificate `
        -certstorelocation cert:\localmachine\my `
        -dnsname portal.azure.com 

$cert_path = "cert:\localMachine\my\" + $cert.Thumbprint

Export-Certificate `
    -cert $cert_path `
    -Type CERT `
    -FilePath .\man_cert.cer

