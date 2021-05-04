# by default the guest login credential are increment by 1 

$ServerIP = Read-Host "Enter Server IP"
if ($ServerIP -eq ""){
	write-host no IP, no work
	exit
	}
	
$UnameBase = Read-Host "Enter Username Base, default is user"
if ($UnameBase -eq ""){
	$UnameBase="user"
	}
	
$Count = Read-Host "Enter number of user to login, default is 10"
if ($Count -eq ""){
	$Count="10"
	}
	
$Password = Read-Host "Enter a password"
if ($Password -eq ""){
	write-host no password, no work
	exit
	}

$width = Read-Host "Enter RDP window width, default is 1920"
if ($width -eq ""){
	$width="1920"
	}

$height = Read-Host "Enter RDP window height, default is 1080"
if ($height -eq ""){
	$height="1080"
	}
	
write-host loggin into $ServerIP from $UnameBase"1" to $UnameBase$Count using $width x $height resolution

cmdkey.exe /delete:TERMSRV/$ServerIP

for ($i=1; $i -le $Count; $i++){
	$uname = $UnameBase+$i
	cmdkey.exe /generic:TERMSRV/$ServerIP /User:$uname /pass:$Password
	mstsc.exe /v:$ServerIP /W:$width /H:$height
	if ( $i -le 30){
		$SleepDuration = 2
		}
	else {
		$SleepDuration = [int][Math]::Ceiling( ($i - 30) / 10 ) + 2
	}
    write-host on $uname login
	sleep $SleepDuration
	cmdkey.exe /delete:TERMSRV/$ServerIP
}