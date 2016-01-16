#Storage

No iOS temos 4 opções de armazenamento:
File system
User Defaults
SQLite
Keychain

Saber quando utilizar cada um deles é crucial para uma boa manutenibilidade do código:
User Defaults: utilize quando precisar gravar dados simples do tipo chave/valor. Não Possui limitação de tamanho de objeto, a capacidade do device é o limite.
Área exclusiva por aplicativo, não é possível compartilhar dados entre aplicativos nessa área. Um ponto importante para ter em mente é que essa área não é segura, portanto nunca salve dados sensíveis aqui.
Ex. Preferências do aplicativo, timestamp de obtenção de token de API, flags indicando que o usuário já visualizou um determinado tutorial ou passou por certo fluxo, etc.

Keychain: Basicamente atende ao mesmo propósito do User Defaults, salvar chave/valor, porém de forma segura. Altamente recomendado para armazenar dados sensíveis do usuário.
Ex: Armazenar token de sessão, password e etc.

SQLite: utilize o SQLite para armazenar dados inerentes às entidades de seu modelo de negócio. 
Ex. Para um aplicativo de força de vendas, os dados dos clientes como nome, endereço, telefone, etc devem ser armazenados em uma tabela do SQLite e mapeados em uma entidade do seu modelo de negócio, como por exemplo uma classe Customer
Idealmente, cada entidade tem uma tabela no SQLite para armazenar seus dados.

É recomendado que a implementação de acesso ao SQLite seja feita através da library FMDB junto ao CITFramework que contém o CITDatabase que já é um Provider junto a algumas categories auxiliares. Alguns pontos a se considerar seriam:
Um banco por usuário. O framework se encarrega de converter o username em um md5 mapeando o banco local em uma pasta que possui esse hash como nome dentro de Documents.
O manager possui protocolos para os scripts de criação/migração e versionamento.
Não possui ORM, portanto é preciso escrever as queries.
O FMDB deverá ser instalado através do cocoapods.
Todos os callbacks são feitos com blocks.
Tente sempre criar constantes para as queries.
O FMDB já se encarrega da concorrência, para fazer isso de modo fácil e rápido utilize a classe CITDatabaseQueue.


	Confira AQUI o exemplo do FMDB em funcionamento (é necessário executar o comando pod install para gerar o workspace).

	

Entendendo o CITDatabase
Schema (//TODO 1)
 Esse arquivo deve assinar os protocolos contidos no arquivo "CITDatabaseManager".
Nessa classe deve conter todas as queries de create table no método createTableQueries.
É p reciso criar um arquivo por versão de banco, dessa forma a migração ocorrerá sem grandes problemas.
Para que a migração funcione é necessário implementar os métodos schemaVersion e newVersion que retornarão um inteiro referente a versão do schema e da nova versão do db relacionado ao schema.

Data Access Categories (//TODO 2)
Deve ser uma category por tabela do banco.
Nessa classe estarão todos os métodos e queries de insert, update, delete e select.

File System: o sistema de arquivos do dispositivo pode ser utilizado para armazenar arquivos criados pela aplicação ou dados serializados. Arquivos nesta área são criados utilizando a classe NSFileManager. 

	

Data Container: área privada por aplicação. Deve ser utilizada para armazenar dados privados ou que interessam somente à aplicação como imagens adicionais baixadas para serem mostradas dentro do aplicativo, PDFs gerados pelo app e etc . Esta área também é utilizada como área de cache padrão do framework. Ao desinstalar o aplicativo, todos os dados salvos nesta área removidos.
Documents
Use esse diretório para salvar conteúdo gerado pelo o usuário. 
O conteúdo desse diretório poderá ficar disponível para o usuário atráves do compartilhamento de arquivo, portanto esse diretório deve conter apenas arquivos que você queira expor ao usuário. 
O conteúdo desse diretório é salvo pelo backup do iTunes.

Library
Ideal para todo e qualquer arquivo que você não deseja expor ao usuário.
Todos o conteúdo, com exceção dos subdiretórios da pasta Cache, serão salvos pelo o backup do iTunes.
Sua app não deve usar esse diretório para arquivos de dados do usuário.
Temp
Use esse diretório para salvar arquivos temporários.
Quando não forem mais necessários, quando sua app não estiver mais em uso os arquivos desse diretório serão deletados.
O conteúdo desse diretório não é salvo pelo backup do iTunes.

iCloud Container: Também utiliza NSFileManager com o ubiquitous, ideal para salvar arquivos que tem certa relevância a ponto de não poder perder tais arquivos caso o app seja resetado ou deletado.

Para saber mais sobre os tipos de armazenamento e suas características veja a documentaçãp oficial aqui.