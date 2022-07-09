FROM python:3.10.5-alpine3.16

ADD Pipfile* /

RUN : \
    && apk add --no-cache openssh \
    && pip install pipenv \
    && pipenv install --deploy --system \
    ;

ADD .ssh /root/.ssh/
ADD ansible/ /etc/ansible/

ENV ANSIBLE_HOST_KEY_CHECKING=False

WORKDIR /etc/ansible
ENTRYPOINT [ "ash", "-c" ]
CMD [ "ash" ]
