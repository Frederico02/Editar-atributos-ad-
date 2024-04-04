# Tenta encontrar o usuário no Active Directory
$user = Get-ADUser -Filter { SamAccountName -eq $userName }

if ($user -eq $null) {
    Write-Host "Usuário não encontrado."
} else {
    # Obtém o valor atual de extensionAttribute1
    $currentValue = $user.extensionAttribute1
    
    Write-Host "O valor atual do extensionAttribute1 para o usuário '$userName' é '$currentValue'."
}
