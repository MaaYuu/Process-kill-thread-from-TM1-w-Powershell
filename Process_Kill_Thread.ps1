Import-Module CredentialManager

$cred = Get-StoredCredential -Target smartco
$pass = $cred.Password

$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass)
$psw = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
[Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)

$thread = $args[0]

$params = @{
    Uri = "https://ibmdemos:31004/api/v1/Threads(" + $thread + ")/tm1.CancelOperation"
    Headers = @{ 'Authorization' =  $psw}
    Method = 'POST'
    ContentType = 'application/json'
}
    
add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 

Invoke-RestMethod @params