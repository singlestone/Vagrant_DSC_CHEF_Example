# Install Chef Client

Start-Process -FilePath 'msiexec' -ArgumentList '/qb /i C:\vagrant\software\chef-client-12.10.24-1-x86.msi ADDLOCAL="ChefClientFeature,ChefServiceFeature,ChefPSModuleFeature"' -NoNewWindow -Wait

