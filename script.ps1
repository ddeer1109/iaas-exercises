
$NameList=’John’,’Charlotte’,’Sean’,’Colleen’,’Namoli’,’Maura’,’Neula’
$NumberList=’1’,’2',’345’,’77’


# $webappname = "webapp$(Get-Random -InputObject $NameList)$(Get-Random -InputObject $NumberList)"
$rgname = "$(Get-Random -InputObject $NameList)$(Get-Random -InputObject $NumberList)-rg"
$location = 'westus3'

Get-Random -InputObject $NameList

# Write-Host "$(Get-Random -InputObject $NameList)$(Get-Random -InputObject $NumberList)"



New-AzResourceGroup -Name $rgname -Location $location

New-AzResourceGroupDeployment -ResourceGroupName $rgname -TemplateUri ./keyvault.json -TemplateParameterUri ./keyvault.parameters.json
New-AzResourceGroupDeployment -ResourceGroupName $rgname -TemplateUri ./webapp.json -TemplateParameterUri ./webapp.parameters.json
New-AzResourceGroupDeployment -ResourceGroupName $rgname -TemplateUri ./insights.json -TemplateParameterUri ./insights.parameters.json
