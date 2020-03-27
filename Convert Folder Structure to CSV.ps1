Get-ChildItem -Recurse c:\directory\to\scan\ |
       ForEach-Object {$_ |
       add-member -name "Owner" -membertype noteproperty -value (get-acl $_.fullname).owner -passthru} |
       Sort-Object fullname |
       Select FullName,CreationTime,LastWriteTime,Length,Owner |
       Export-Csv -Force -NoTypeInformation c:\folder\to\directory.csv"
