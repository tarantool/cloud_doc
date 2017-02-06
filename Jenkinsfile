#!groovy

stage("Build")
{
    node {
        checkout scm

        docker.image('tarantool/build:centos7').inside('--user root:root') {
            sh "pip install -r requirements.txt --upgrade"
            sh "make html"
            sh "tar -C build -cvzf doc_html.tar.gz ."
        }
    }
}
