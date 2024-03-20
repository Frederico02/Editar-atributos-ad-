# Solicita ao usuário o nome do usuário do Active Directory
$userName = Read-Host "Digite o nome do usuário do Active Directory"

# Solicita ao usuário o valor para atribuir ao extensionAttribute1
$newValue = Read-Host "Digite o novo valor para o extensionAttribute1"

# Tenta encontrar o usuário no Active Directory
$user = Get-ADUser -Filter { SamAccountName -eq $userName }

if ($user -eq $null) {
    Write-Host "Usuário não encontrado."
} else {
    # Define o valor de extensionAttribute1 para o novo valor
    Set-ADUser -Identity $user -Replace @{extensionAttribute1 = $newValue}
    
    Write-Host "O valor do extensionAttribute1 foi atualizado com sucesso para '$newValue' para o usuário '$userName'."
}
