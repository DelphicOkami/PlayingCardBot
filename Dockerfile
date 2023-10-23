FROM golang:1.15-alpine AS build
RUN apk add git

RUN git clone https://github.com/svntax/PlayingCardsBot.git

WORKDIR /go/PlayingCardsBot

RUN go build -o /bin/PlayingCardBot ./main.go
FROM golang:1.15-alpine AS run
COPY --from=build /bin/PlayingCardBot /bin/PlayingCardBot
CMD ["/bin/PlayingCardBot"]
