# Teste Api

## Dependências:

* ruby 2.4.0
* HTTParty
* Rspec


Para instalar as dependências acima primeiro, precisamos instalar o rvm (Ruby Version Mananger) para que assim possamos instalar o as gems acima.

Para isso execute o comando :

`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`

Com isso adicionamos o repositório do ruby a lista de repositórios do sistema. Após a adição, baixe e instale o rvm e o ruby com o seguinte comando.

`\curl -sSL https://get.rvm.io | bash -s stable --ruby`

siga os passos subsequentes para finalizar a instalação.

Após o término da instalação do ruby, instale as gems HTTParty e o Rspec com o seguinte comando:

`gem install rspec`

`gem install httparty`

Após o término da instalação das gems, acesse o diretorio do projeto e execute o comando a seguir para que o ambiente esteja configurado.

`bundle install`

## Executando os testes

Para executar os testes, digite o seguinte comando no terminal, na pasta raiz do projeto:

`rspec apiTest.rb -fd`

O comando executara os testes no formato de documento, descrevendo na saída do terminal o nome do passo que esta executando e o resultado esperado. A cada passo executado o teste listara em verde no terminal, os scenarios que passarem na validação e, listara de vermelho os testes que falharem na validação, e no final exibira a quantidade de scenarios que passaram, a quantidade que falhou, e descrevera o resultado esperado na validação e o que ele conseguiu após executar a requisição ao serviço da api.

Os testes estão configurados primeiramente para serem executdados na api de stage, para que possam ser executados na api de produçãp basta trocar no inicio do codigo, na classe **TestParty**, o parametro **base_uri**, que esta em stage para a url de produção, salvar e repetir o comando acima para que possam ser executados.


## Scenarios analisados e Resultados

Os scenarios executados procuravam encontrar erros na api de stage e validar se os mesmos eram encontrados na api de produção, nenhum dos erros encontrados na api de stage foi encontrado na api de produção, passando em todos os 19 scenarios de testes realizados na api.

Em geral o comportamento foi satisfatório na api de produção validando corretamente query’s enviadas nos testes, mas uma ressalva a respeito das respostas retornadas da api, que em sua maioria, não tratavam corretamente a situações.: a resposta de uma request com um parâmetro a menos e uma request com o mesmo parâmetro só que com a sua formatação errada, é o mesmo).Já na api de stage, os erros ocorreram na validação dos parametros enviados e nas respostas recebidas(Ex.: respostas que não condizem com o erro, status code 200 quando deveriam vir 400 e a a chave errorMessage na api de stage esta escrita errada errrorMessage, com um r a mais em seu texto)


## Melhorias:

As respostas da api poderiam ser menos genéricas e validar todas as situações, outra melhoria seria a tratativa dos dados recebidos, para que independente de como ele seja escrito, contanto que esteja correto, a api possa ser capaz de aceitar, além de corrigir a validação da api de stage, bem como a sua resposta.