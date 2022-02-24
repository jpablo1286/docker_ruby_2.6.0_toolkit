FROM ruby:2.3.7

ARG ssh_prv_key
ARG ssh_pub_key

RUN apt-get update

RUN apt-get install -y build-essential libtool automake pkg-config git wget gettext-base tar curl zlib1g-dev gnupg openssl cmake qt4-qmake qt4-dev-tools libqt4-dev qt4-default libqtwebkit4 libqtwebkit-dev

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get install -y nodejs gcc g++ make

RUN gem install racc -v 1.5.2

RUN gem install nokogiri -v 1.6.8.1

RUN gem install sprockets -v 3.7.2

RUN gem install activesupport -v 5.2.6.2

RUN gem install globalid -v 0.4.2

RUN gem install rails -v 5.0.0

RUN gem install bundler

RUN mkdir /src

WORKDIR /src

# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
COPY keys/id_ed25519 /root/.ssh/id_ed25519 
COPY keys/id_ed25519 /root/.ssh/id_ed25519.pub 
RUN chmod 600 /root/.ssh/id_ed25519 && \
    chmod 600 /root/.ssh/id_ed25519.pub

RUN  echo "    IdentityFile ~/.ssh/id_ed25519" >> /etc/ssh/ssh_config

CMD ruby --version