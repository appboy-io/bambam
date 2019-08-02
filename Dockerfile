FROM google/dart

WORKDIR /app

ADD pubspec.* /app/

RUN pub get

ADD . /app

RUN pub get --offline

ENV duration 30

ENV url https://jsonplaceholder.typicode.com/todos/1

ENV users 15

ENTRYPOINT [ "ls ." ]
#ENTRYPOINT [ "/usr/bin/dart", "main.dart" ]

CMD ["-d", "${duration}", "-w", "${url}", "-u", "${users}"]


