# Connect multi RDP session on different machines
# The format in the csv file shall in following format
# Name	    IP
# test      192.168.0.123

$compnames = import-csv "<source_file_in_csv_format>"


$User      = "<username>"
$Password  = "<password>"


foreach ($computer in $compnames) {

    cmdkey /generic:TERMSRV/$($computer.IP) /user:$User /pass:$Password
    mstsc /v:$($computer.IP)

    }