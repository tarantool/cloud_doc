#!groovy

stage("Build")
{
    node {
        checkout scm

        docker.image('tarantool/build:centos7').inside('--user root:root') {
            sh "sudo pip install -r requirements.txt --upgrade"
            sh "make html"
            sh "tar -C build -cvzf doc_html.tar.gz ."
        }

        sshagent(['3b02c16d-d8fc-4082-ba2f-38e48d8a4993']) {
            env.SERVER = "try.tarantool.org"
            env.USER = "knazarov"
            env.DEST_DIR = "/var/www/tarantool.io"

            sh "mkdir -p ~/.ssh"
            sh "chmod 700 ~/.ssh"
            sh "ssh-keyscan $SERVER > ~/.ssh/known_hosts"
            sh "chmod 600 ~/.ssh/*"
            sh "rsync -Pav build/* $USER@$SERVER:$DEST_DIR"
        }
    }
}
