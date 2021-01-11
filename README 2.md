# App Cinesofa 

App desenvolvida para avaliação do beca mobile iOS everis 

App busca informações dos principais filmes vistos na semana na api fornecida pelo site www.themoviedb.org.

#### Desenvolvimento:
- Foi utilizado structs para criar a estrutura do objeto results, o Structs results separa a parte de informações apenas referente aos filmes que esta dentro do dicionário results, por ser um array de dicionário e conter a informação pages é especificado na structs que se deseja apenas as informações referentes ao dicionário results.

- A consulta a api é feita através da bibilioteca URLRequest e depois decodificada com JSONDecoder montando assim os objetos referentes a structs results

- Foi criado uma TableView onde é carregado a lista de filmes e a imagem do pôster referente a cada uma, em conjunto foi criado uma View onde é apresentado a descrição do filme selecionado na tableview.

#### Principais Dificuldades:
- Inicialmente problemas com o alamofire, creio que por ser a versão 10.1 do Xcode que estava usando, instalei a 11.2 também porém continuei tendo dificuldades.
Dificuldade inicial para compreender o funcionamento do structs e encoders, revi o material e estudei um pouco mais para compreender o mesmo.

- Devido a dificuldade com a requisição de informações da api e recuperação na tela das mesmas o design acabou ficando pouco explorado.






