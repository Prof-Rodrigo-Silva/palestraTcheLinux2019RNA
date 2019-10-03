# palestraTcheLinux2019RNA

Material utilizado na palestra da TcheLinux 2019 - Bagé-RS.

Conta com a apresentação e script do R usados como exemplos e arquivos tanto csv como arff para o WEKA.

Procedimentos Preliminares

Instalação WEKA em distribuições Linux:

1º - Acesse https://www.cs.waikato.ac.nz/ml/weka/downloading.html e faça o download da versão

2º - Primeiro descompacte o arquivo zip. Isso criará um novo diretório chamado weka-SUA_VERSÃO.

Para executar o Weka, mude para esse diretório e digite:

```java -jar weka.jar```

Observe que o Java precisa estar instalado no seu sistema para que isso funcione. Observe também que o uso ```-jar``` substituirá
a variável CLASSPATH atual e usará apenas o ```weka.jar```.

![Pronto!](https://media.giphy.com/media/RrVzUOXldFe8M/giphy.gif)

Instalação R/RStudio em distribuições Linux UBUNTU, DEBIAN E DERIVADOS:

1º - Confira se o seu sistema é de 32 bits ou 64 bits, para isso, use o seguinte comando no terminal:

```uname -m```

2º - Acesse https://rstudio.com/products/rstudio/download/#download e faça o download da versão

3º - Instale o programa com os comandos abaixo:

```sudo dpkg -i rstudio.deb```

```sudo apt-get install -f```

Ob: Se preferir, use o comando abaixo para instalar o programa;

```sudo apt install ./rstudio.deb```

![Pronto!](https://media.giphy.com/media/3og0IAb2bYrugrR4sw/giphy.gif)


4º - Se precisar desinstalar o programa, use esse comando:

```sudo apt-get remove rstudio*```

![](https://media.giphy.com/media/cdNSp4L5vCU7aQrYnV/giphy.gif)

Instalação R/RStudio em distribuições Linux FEDORA, OPENSUSE, CENTOS E DERIVADOS

1º - Confira se o seu sistema é de 32 bits ou 64 bits, para isso, use o seguinte comando no terminal:

```uname -m```

2º - Acesse https://rstudio.com/products/rstudio/download/#download e faça o download da versão

3.1 - Para instalar em um openSUSE ou um de seus derivados, use o comando abaixo:

```sudo zypper install rstudio.rpm```

3.2 - Para instalar em um Fedora, RedHat e seus derivados, use o comando abaixo:

```sudo yum localinstall rstudio.rpm```

ou

```sudo dnf install rstudio.rpm```

3.3 - Para instalar o programa na maioria das distro com suporte a arquivos RPM, use o comando:

```sudo rpm -i rstudio.rpm```

![Pronto!](https://media.giphy.com/media/1rPV51YswrTUafzQes/giphy.gif)

4º - Se precisar desinstalar o programa, use esse comando:

```sudo rpm -e rstudio*```

![](https://media.giphy.com/media/XHU4qC33lv0Ek5zqPv/giphy.gif)

Pacotes necessários

Use os comandos abaixo para adicionar os pacotes:

```install.packages("neuralnet",dependencies = T)```

```install.packages("NeuralNetTools",dependencies = T)```

```install.packages("caret",,dependencies = T)```

```install.packages("h2o",dependencies = T)```

```install.packages("caTools",dependencies = T)```

Use os comandos abaixo para carregar os pacotes:

```library(neuralnet)```

```library(NeuralNetTools)```

```library(caret)```

```library(h2o)```

```library(caTools)```

![Legenda](https://media.giphy.com/media/3o7TKUM3IgJBX2as9O/giphy.gif)
