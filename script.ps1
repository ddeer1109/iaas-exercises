
$NameList=’John’,’Charlotte’,’Sean’,’Colleen’,’Namoli’,’Maura’,’Neula’
$NumberList=’1’,’2',’345’,’77’


# $webappname = "webapp$(Get-Random -InputObject $NameList)$(Get-Random -InputObject $NumberList)"
$rgname = "$(Get-Random -InputObject $NameList)$(Get-Random -InputObject $NumberList)-rg"
$location = 'westus3'

Get-Random -InputObject $NameList

# Write-Host "$(Get-Random -InputObject $NameList)$(Get-Random -InputObject $NumberList)"



New-AzResourceGroup -Name $rgname -Location $location
Write-Host "Press any key to continue..."

New-AzResourceGroupDeployment -ResourceGroupName $rgname -TemplateUri https://raw.githubusercontent.com/ddeer1109/iaas-exercises/main/keyvault.template.json -TemplateParameterUri https://raw.githubusercontent.com/ddeer1109/iaas-exercises/main/keyvault.parameters.json
Write-Host "Press any key to continue..."

New-AzResourceGroupDeployment -ResourceGroupName $rgname -TemplateUri https://raw.githubusercontent.com/ddeer1109/iaas-exercises/main/webapp.template.json -TemplateParameterUri https://raw.githubusercontent.com/ddeer1109/iaas-exercises/main/webapp.parameters.json
Write-Host "Press any key to continue..."

New-AzResourceGroupDeployment -ResourceGroupName $rgname -TemplateUri https://raw.githubusercontent.com/ddeer1109/iaas-exercises/main/insights.template.json -TemplateParameterUri https://raw.githubusercontent.com/ddeer1109/iaas-exercises/main/insights.parameters.json
