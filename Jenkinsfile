pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'PythonDevOps', url: 'https://github.com/vivekhanni/pythonproject.git']]])
            }
        }
       
        stage('custom image build') {
            steps {
                echo "-=- custom image build -=-"
                sh "docker build -t dockerpython ."
            }
        }
        stage('container run') {
            steps {
                echo "-=- container run -=-"
                sh "docker run -d --name pythoncontainer dockerpython"
            }
        }
        stage('expose') {
            steps {
                echo "-=- application publish -=-"
                sh "docker run -p 5000:5000 dockerpython"
            }
        }
    }
}
