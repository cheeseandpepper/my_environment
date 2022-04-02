alias murderdocker='docker-compose down && docker image rm -f $(docker images -a -q) && docker rm $(docker ps -a -q) && docker system prune --volumes -a -f'
alias freshdocker='docker build --no-cache - < Dockerfile'

alias dwp='docker-compose up -d app && docker attach app'


