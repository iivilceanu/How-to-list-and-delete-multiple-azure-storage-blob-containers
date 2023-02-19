#List the SA containers:

list=$(az storage container list --query "[].name" --prefix groupthecontainersbynameprefix --account-name yourstorageaccountname --account-key yourstroageaccountkey --output tsv)
 
#Delete all the azure storage account blob containers or only listed containers:

for row in $list
do
    tmpName=$(echo $row | sed -e 's/\r//g')
az storage container delete --name $tmpName groupthecontainersbynameprefix --account-name yourstorageaccountname --account-key yourstroageaccountkey
done  
