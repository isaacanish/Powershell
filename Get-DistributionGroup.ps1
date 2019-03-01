#Getting the user list
$Grouplist = Get-Content -Path C:\Users\RS00518362-a\Desktop\DLaliasfor5users.txt

#Using the command to get the details 
$outfile= ForEach($Group in $Grouplist)
{
Get-DistributionGroup | Where-Object{$_.ALIAS -cmatch $Group }| Select-Object RecipientTypeDetails,Name,Alias,DisplayName,PrimarySmtpAddress,@{name="SMTPDomain";expression={$_.PrimarySmtpAddress.Domain}},MemberJoinRestriction,MemberDepartRestriction,RequireSenderAuthenticationEnabled,@{Name="ManagedBy";Expression={$_.ManagedBy -join “;”}},@{name=”AcceptMessagesOnlyFrom”;expression={$_.AcceptMessagesOnlyFrom -join “;”}},@{name=”AcceptMessagesOnlyFromDLMembers”;expression={$_.AcceptMessagesOnlyFromDLMembers -join “;”}},@{name=”AcceptMessagesOnlyFromSendersOrMembers”;expression={$_.AcceptMessagesOnlyFromSendersOrMembers -join “;”}}}
 #Exporting the file to CSV
 $outfile | Out-File -FilePath C:\Temp\anish.csv