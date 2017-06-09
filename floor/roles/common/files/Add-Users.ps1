$Users = Import-Csv -Path "C:\user-create.csv"

foreach ($Line in $Users) {
    $Username = $Line.username
    $Password = $Line.password
    & NET USER $Username $Password /add /y
}
