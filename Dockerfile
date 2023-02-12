# ETAPA 1 - Montar o ambiente para compilar o hello.go
FROM golang:alpine3.17 AS compiler

WORKDIR /src

# Copiando o módulo com as dependências
COPY ./go.mod ./

# Copiando o programa
COPY ./hello.go ./

# Compilando o programa
RUN go build



# ETAPA 2: Final
FROM scratch

COPY --from=compiler ./src/hello ./

CMD ["./hello"]
