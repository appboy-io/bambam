FROM google/dart

WORKDIR /app

ADD pubspec.* /app/

RUN pub get

ADD . /app

RUN pub get --offline

ENV DURATION=30

ENV URL="https://jsonplaceholder.typicode.com/todos/1"

ENV USERS=15

RUN echo "/usr/bin/dart bin/main.dart -d \$DURATION -w \$URL -u \$USERS" > /run_bambam.sh

ENTRYPOINT [ "/bin/bash", "/run_bambam.sh"]