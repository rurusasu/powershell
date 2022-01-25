$ErrorActionPreference = "stop"

try {
    $ result = choco
    echo $result
}
catch{
    #echo "catch!!"
    echo $Error[0]
}


#$result = choco

#echo $result

#Remove-Item C:\ProgramData\chocolatey