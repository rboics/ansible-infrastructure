$Users = Import-Csv -Path "C:\Temp\user-create.csv"

foreach ($Line in $Users) {
    $Username = $Line.username
    $Password = $Line.password
    $Admin = $line.admin
    & NET USER $Username $Password /add /y
    If ($Admin == "y") {
        & NET LOCALGROUP "Administrators" $Username /add
    }
}
