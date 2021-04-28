# Powershell
Criação de uma Powershell que armazena os alias de uma xml em variáveis, cria um bkp deste arquivo, substitui as variáveis armazenadas no arquivo da nova versão e depois sobe este novo arquivo no repositório do IIS. 

No primeiro momento foram definidas variáveis globais, utilizadas no andamento do PowerShell. Antes de iniciar qualquer modificação, foi configurado para que seja realizado o bkp do arquivo que encontra-se em execução no IIS. Após a realização do BKP, realiza-se a leitura do arquivo e iniciamos a extração dos values com novas variáveis, para armazenamento destas e utilização posterior.

Em seguida, é realizado a substituição das values na v2 do app pelos valores armazenados nas variáveis armazenadas anteriormente. Após isso, o  arquivo é copiado para a pasta c:\inetpub\wwwroot\ com o nome original de appversion.xml.
