# Mockflix
## _Projeto Beca iOS everis_
### Becário: Lucas Werner Kuipers

Aplicativo que realiza listagem de filmes e exibição dos detalhes.

- API: https://api.themoviedb.org/ (versão 3)
- Xcode: 12.4
- Foi utilizada estrutura codable para armazenamento da resposta
- Requisições utilizaram a biblioteca Alamofire e AlamofireImage

## Telas & Features

1. Tela inicial com listagem de filmes por categoria
2. Tela de detalhes do filme clicado
3. Tela de pesquisa de filmes

As telas estão inseridas em navigation controllers e estes estão inseridos em um tab bar controller.

### Tela Inicial
A tela inicial é composta (no momento) por 3 collections (trending, popular e top rated).
Essas coleções estão empilhadas verticalmente na tela e cada umua exibe os posteres dos filmes correspondentes em um scroll horizontal.
É gerado um numero exageradamente alto de celulas em cada collection e são preenchidas em um padrão repetido da lista de filmes que foi adquirida pela requisicao à API naquela categoria. 
Logo ao entrar no aplicativo, cada collection é arrastada até a metade, de tal forma que o último elemento antecede o primeiro, criando a ilusão de scroll infinito (ou circular) para ambos os lados.
Clicando em cada um dos posteres o usuário é redirecionado para a segunda tela, onde são dispostos os detalhes do filme correspondente (através de uma nova requisição mais aprofundada que utiliza o índice do filme clicado na primeira tela)

### Tela de detalhes
Exibe (no momento) o backdrop_image do filme, título, sinopse e rating. 
Foi implementado gesto nesta tela, de tal forma que pode-se arrastar para direita para fechá-la (similar ao comportamento do instagram), fazendo pop da tela atual e voltando à tela inicial com a listagem de filmes.

### Tela de pesquia
Através de um botão no tab bar inferior da tela o usuário é levado à tela de pesquisa.
A tela consiste em basicamente uma table view com um search bar no topo.
Toda vez que o texto na search bar muda, é feita uma nova requisição à API, utilizando como argumento da consulta este mesmo texto. Cada item do resultado é então atrbuído à uma célula da table view, mostrando o título daquele filme. 
Ao clicar em qualquer célula o usuário é levado à tela de detalhes novamente, exibindo o filme correspondente.

## Problemas conhecidos
- Ao entrar na tela de pesquisa, o usuário precisa escolher um filme para voltar à tela inicial.
- Em dispositivos menores (como Iphone SE) parte da telas podem ficar cobertas.

## Principais dificuldades
- Entender e implementar a comunicação de dados entre telas de maneira limpa e concisa.
- Encontrar o campo do codable que faz com que certa resposta da requisição não conforme com o formato interno e o filme não seja armazenado (e por conseguinte exibido na tela).

## Planejamento futuro
- Adicionar mais testes unitários (e mais completos).
- Refatorar código.
- Eliminar a necessidade de uma réplica da tela de detalhes para a tela de pesquisa (melhorar o fluxo de informação entre telas, facilitando sua integração.)
- Adicionar paginação aos resultados exibidos na tela de pesquisas (arrastando para baixo ou clicando em um botão para buscar mais resultados).
- Inserir coleções de filmes em uma table view e gerar cada coleção de maneira programática, apenas criando uma lista do nome e url de requisicao para cada seção e utilizando essa lista como argumento para a tableview.
- Implementar skeleton loading a ser exibido até que sejam carregadas as informações das requisicoes.
- Adicionar scroll view na tela de detalhes, permitindo maior acessibilidade à dispositivos menores e maior liberdade para adicionar mais detalhes.
- Adicionar mais detalhes na segunda tela: como diretor, ano, elenco, revenue, duracao, subtitulo, idiomas disponiveis, coloecoes que faz parte, classificacao indicativa e trailer.
- Adicionar tela de detalhes para ator (acessada pela lista do elenco) que exibe informacoes como em quais filmes participa.
- Adicionar secao com lista de filmes semelhantes, na parte inferior da tela de detalhes.
- Implementar lista de séries de maneira análoga à de filmes, mas com temporadas, episódios... entre outros.
- Melhorar experiencia no aplicativo através de respostas hapticas e sons agradáveis.
- Adicionar opçoes de favoritar filmes e/ou adicionar à uma playlist (e poder criar playlists). Salvar essas informaçoes na Core Data e posteriormente adicionar opção de logar-se ao aplicativo, sincronizando informacoes com algum servidor.
- Adicionar customizacao do aplicativo pela preferencia do  usuario (cores, modo noturno...)
- Adicionar sistema de notificacoes push (filmes lancados recentemente, recomendacoes semanais, filmes lancados de atores seguidos...)
