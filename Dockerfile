FROM ubuntu:22.04
LABEL engg="pratik"

USER root
RUN apt update
RUN apt install -y python3 python3-pip git
RUN pip install virtualenv
RUN mkdir envs
RUN virtualenv ./envs/
RUN . envs/bin/activate
RUN git clone https://github.com/PratikBorge/simple-django-project.git
WORKDIR /simple-django-project/
RUN apt-get install -y python3-dev default-libmysqlclient-dev libxml2-dev libxslt1-dev build-essential libffi-dev 
RUN pip install -r requirements.txt
RUN pip install mysql-connector-python
RUN pip install django==3.2 django-haystack==3.0
RUN /usr/bin/python3 manage.py makemigrations
RUN /usr/bin/python3 manage.py migrate
EXPOSE 8001
CMD ["/usr/bin/python3", "manage.py", "runserver", "0.0.0.0:8001"]