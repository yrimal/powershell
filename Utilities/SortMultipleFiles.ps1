#Update the $path with the actual location of text files
$path = "C:\ProgramData\Path\"
$outputfiles=gci -Name $path -Recurse -include *.txt
for($i=0;$i -lt $outputfiles.Length;$i++)
{
$file=$path+"\"+$outputfiles[$i];
$newFile=[IO.Path]::GetDirectoryName($file)+"\"+[IO.Path]::GetFileNameWithoutExtension($file)+"_sorted.txt"
get-content $file | sort | Out-File -FilePath $newFile -Encoding ASCII
"Completed "+$file
#Remove-Item $file
}