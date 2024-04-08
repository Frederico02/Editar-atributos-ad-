# Solicita ao usuário o nome do usuário do Active Directory
$userName = Read-Host "Digite o nome do usuário do Active Directory"

# Tenta encontrar o usuário no Active Directory
$user = Get-ADUser -Filter { SamAccountName -eq $userName } -Properties extensionAttribute1

if ($user -eq $null) {
    Write-Host "Usuário não encontrado."
} else {
    # Obtém o valor atual do extensionAttribute1 do usuário
    $extensionAttribute1Value = $user.extensionAttribute1
    
    if ($extensionAttribute1Value -ne $null) {
        Write-Host "O valor do extensionAttribute1 para o usuário '$userName' é '$extensionAttribute1Value'."
    } else {
        Write-Host "O usuário '$userName' não possui um valor definido para extensionAttribute1."
    }
}
