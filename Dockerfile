FROM ubuntu:22.04
LABEL engg="pratik"

USER root
RUN apt install -y python-3.7.2 python-pip git
RUN pip install virtualenv
RUN mkdir envs
RUN virtualenv ./envs/
RUN source . envs/bin/activate
RUN git clone "https://github.com/Manisha-Bayya/simple-django-project.git"
WORKDIR /simple-django-project/
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py rebuild_index
EXPOSE 8001
CMD python manage.py runserver 0:8001