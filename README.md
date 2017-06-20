# Viva Real - Code Challenge
## Desafio Backend

### Ferramentas:
- Ruby 2.3.1
- Rails 5.1.1
- RSpec 3.6
- SQLite
- Puma

### Dependências:
- Docker (https://www.docker.com/)
- Docker Compose (https://docs.docker.com/compose/)

### Instalação
1) Instalar Docker: https://www.docker.com/community-edition#/download
2) Clonar repositório:
```shell
$ git clone git@github.com:guilhermeslk/vr-code-challenge.git
```
3) Realizar build do ambiente:
```shell
$ docker-compose build
```
4) Criar banco de dados da API no container web:
```shell
$ docker-compose run web rake db:create db:migrate
```
5) Rodar seeds para cadastro de províncias:
```shell
$ docker-compose run web rake db:seed
```
6) Subir ambiente:
```shell
$ docker-compose up
```

A aplicação estará rodando em http://localhost:3000 :)


### Testes:

1) Criar banco de dados de testes:
```shell
$ docker-compose run rake db:create db:migrate RAILS_ENV=test
```

2) Rodar suíte:
```shell
$ rspec
```


