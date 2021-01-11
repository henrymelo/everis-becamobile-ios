# Avaliação Beca Mobile iOS

Criar um aplicativo que realize a listagem de filmes e exibição dos detalhes:
 * Tela principal, lista de filmes:
    - Listar capa dos filmes que são tendências da semana. 
 * Tela de detalhes do filme:  
    - Quando o usuário selecionar um filme, o aplicativo deve direciona-lo para uma segunda tela e exibir o título, capa, rating e sinopse. 

* API para consumo: 
  - A listagem de filmes deve ser consultada na API https://developers.themoviedb.org/3/getting-started/introduction 
    Ao se cadastrar você receberá uma chave de acesso, que deverá ser usada nas requisições. 
  - Requisição para listar as tendências https://developers.themoviedb.org/3/trending/get-trending
    - Ex.: https://api.themoviedb.org/3/trending/all/week?api_key=00000&language=pt-BR
  - Requisição para listar os detalhes https://developers.themoviedb.org/3/movies/get-movie-details
    - Ex.: https://api.themoviedb.org/3/movie/454626?api_key=00000&language=pt-BR
    
* Se opcionalmente quiser fazer o clone via SSH, segue ajuda do GitHub:
  - https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
  - Se for usar o ssh para clone, este comando ajuda a salvar a chave de forma local: 
    - ssh-add -K ~/.ssh/id_rsa
  
* Ao iniciar a avaliação:
  - Faça um fork deste projeto
  - Fazer o cadastro no site para consumir a API
  
* Mandando bem na avaliação:
  - Realize quantos commits puder, não queremos somente a solução final; queremos saber como você chegou lá. Sua evolução vale tanto quanto o resultado final.
  - A arquitetura é livre, não se procupe com isto neste momento.
  - O Design é livre, mas se tiver um tempinho... gostariamos que fizesse uma revisão final, usando as dicas da Apple:
  https://developer.apple.com/design/tips/
  - Sugestões de bibliotecas:
     - Carregamento de imagens 
       - https://github.com/Alamofire/AlamofireImage
     - Requisições:
       - Opção 1) http https://github.com/Alamofire/Alamofire
       - Opção 2) https://github.com/Moya/Moya

* Ao finalizar a avaliação:
   - Quando finalizar a implementação faça um pull request; na descrição informe qual a abordagem que você utilizou para chegar na solução, descreva também quais foram os maiores desafios para concluir a avaliação.

* :clap: Parabéns por ter chegado até aqui! :smile: _Um grande abraço e bem vindo ao time Mobile iOS_ :iphone: :punch:






Comentários:

No começo fiquei apavorado que não iria dar conta de entregar o app com os requisitos minímos,
A maior dificuldade foi entender como pegar os resultados da API, só dava nil, mas pesquisei bastante e entendi um pouco, depois que entendi, parece que clareou tudo, ficou mais fácil, porém ainda tenho dúvidas, tanto é que não consegui puxar os dados da paginação, por outro lado, eu consegui completar todos os requisitos;

Um ponto importante que eu percebi no decorrer da prova, era qual caminho eu deveria seguir, por exemplo, no tratamento da api, eu fiz funções diversas, com retorno, sem retorno, com paramentro, sem parametro, com completion, sem completion, com isso as vezes eu pensava, perdi 6 horas e não adiantou nada, mas olhando agora no final do projeto, foi um aprendizado sem tamanho, a tentiva e erro, foi meu auto feedback de reforço positivo.

Agradecer aos colegas e a equipe da Everis Beca iOS, que estavam sempre dispostos a ajudar.

Minhas maiores dificuldades foram essas.
