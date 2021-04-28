# Lista de variáveis:

$d = get-date -uformat "%Y%m%d"
$p = "C:\test\app.version\appversion.xml"
$s = "C:\test\app_v2\appversion2.xml"

# Realiza Cópia de Segurança do arquivo que está na pasta App.version (sempre o último que estava rodando, usando a data como nome da copia)

Copy-Item -Path $p -Destination C:\test\BKP\$d.xml

# Lendo o arquivo e colocando em variáveis:

$logs = Get-Content -Path $p | Select-String "logsEnable"
$backendApi = Get-Content -Path $p | Select-String "backendApi"
$environmentId = Get-Content -Path $p | Select-String "environmentId"
$Oracle = Get-Content -Path $p | Select-String "Oracle"

# Copiar variáveis para dentro do novo arquivo v2:

Get-Content -Path $s | Select-String "backendApi" | Set-Content "$backendApi" 
Get-Content -Path $s | Select-String "logsEnable" | Set-Content "$logs"
Get-Content -Path $s | Select-String "EnviromentId" | Set-Content "$environmentId"
Get-Content -Path $s | Select-String "Oracle" | Set-Content "$Oracle"


Configuration localhost {

    # Importação do módulo que contem os recursos em uso.
   Import-DscResource -ModuleName PsDesiredStateConfiguration

    # Escolhendo qual site que será atualizado
     Node 'localhost' {

        # Deixar o IIS habilitado
         WindowsFeature WebServer {
            Ensure = "Present"
            Name   = "Web-Server"
        }

         # Copiar o conteudo para a pasta raiz do site
             SourcePath = '$s'
             DestinationPath = 'c:\inetpub\wwwroot\appversion.xml'

            }
        }