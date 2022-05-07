#!/bin/sh

set -e 

APP_PORT=${PORT:-8000}
SUPERUSER_EMAIL=${DJANGO_SUPERUSER_EMAIL:-"smartquail.info@gmail.com"}

# Name of the application
NAME="qnode0_app"
#VIRTUAL ENV DIRECTORY
VIRTUALDIR="/py/"
# Django project directory
DJANGODIR="/qnode0.0_app/qnode0_app/"
 # we will communicte using this unix socket
SOCKFILE="/qnode0.0_app/qnode0_app/run/gunicorn.sock" 
# the user to run as
USER="qnode0"
 # the group to run as
GROUP="qnode0"
# how many worker processes should Gunicorn spawn
NUM_WORKERS="3" 
# which settings file should Django use
DJANGO_SETTINGS_MODULE="qnode0_app.settings"
# WSGI module name
DJANGO_WSGI_MODULE="qnode0_app.wsgi"

echo "Starting $NAME as `whoami`"
# Activate the virtual environment
#cd $VIRTUALDIR
source $VIRTUALDIR/bin/activate
cd $DJANGODIR
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH 
# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR
# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
python manage.py migrate --noinput
python manage.py createsuperuser --email $SUPERUSER_EMAIL --noinput || true
python manage.py collectstatic --noinput 
gunicorn  --bind "0.0.0.0:${APP_PORT}" --name $NAME --workers $NUM_WORKERS --user=$USER --group=$GROUP --bind=unix:$SOCKFILE --log-level=debug --log-file=-  ${DJANGO_WSGI_MODULE}:application



