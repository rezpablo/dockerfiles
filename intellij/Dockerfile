FROM rezpablo/openjdk8

RUN apt-get update && apt-get install -y wget

RUN wget https://download-cf.jetbrains.com/idea/ideaIU-2016.2.1.tar.gz -O /tmp/intellij.tar.gz -q && \ 
    mkdir -p /opt/intellij && \
    tar -xf /tmp/intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    rm /tmp/intellij.tar.gz

ADD run /usr/local/bin/intellij 

RUN chmod +x /usr/local/bin/intellij

ENV USERNAME developer
RUN adduser --disabled-password --gecos '' $USERNAME && \
    echo developer:developer | chpasswd && \
    echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    adduser developer sudo

RUN apt-get install -y software-properties-common
RUN apt-get install -y libxext-dev libxrender-dev libxtst-dev
RUN apt-get update && apt-get install -y libgtk2.0-0 libcanberra-gtk-module

RUN apt-get install -y git curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN npm install -g yo gulp bower
RUN npm install -g generator-gulp-angular

RUN rm -rf /var/lib/apt/lists/*

ENV GRADLE_HOME=/opt/gradle
ENV PATH=$PATH:$GRADLE_HOME/bin
ENV export GRADLE_OPTS="-Dorg.gradle.daemon=true"

USER $USERNAME
ENV HOME /home/$USERNAME
WORKDIR /home/$USERNAME
CMD /usr/local/bin/intellij
