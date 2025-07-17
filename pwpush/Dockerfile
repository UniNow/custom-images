FROM pglombardo/pwpush:1.58.4

USER root

RUN apk add --no-cache git

USER pwpusher

ADD uninow.patch .

RUN git apply uninow.patch

USER root

RUN apk del git

USER pwpusher

RUN bundle exec rails assets:precompile

