#Teste Mobile

##Dependencias

* Ruby
* Calabash-android
* Android Studio



Para instalar as dependências acima primeiro, precisamos instalar o rvm (Ruby Version Mananger) para que assim possamos instalar o as gems acima.

Para isso execute o comando :

`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`

Com isso adicionamos o repositório do ruby a lista de repositórios do sistema. Após a adição, baixe e instale o rvm e o ruby com o seguinte comando.

`\curl -sSL https://get.rvm.io | bash -s stable --ruby`

siga os passos subsequentes para finalizar a instalação.

Após o término da instalação do ruby, instale as gems HTTParty e o Rspec com o seguinte comando:
 `gem install calabash-android`

Para que os testes ocorram, será necessario tambem a instalação do android studio, para que possamos utilizar o seu AVD (Android Virtual Device). Para isso execute o tutorial que se encontra na seguinte pagina:

https://developer.android.com/studio/install.html

Além disso precisaremos configurar a debug key e  reassinar o apk, para isso siga os seguintes passos descritos no repositorio do calabash-android:

https://github.com/calabash/calabash-android/wiki/Running-Calabash-Android



##Executando os testes


Para executar os testes precisamos apenas executar o comando 

`calabash-android run app2.apk`


Com isso os avd sera inicializado e a automação começara logo em seguida, dando inicio aos testes descritos nas features.

##Resultado dos Testes

Os testes executados no apk ocorreram de forma esperada nos scenarios propostos, executando as suas principais funções como as de scroll infinito e busca dos filmes normalmente