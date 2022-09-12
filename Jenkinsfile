pipeline {
    agent any
    stages {
        stage('container deletion') {
            steps {
                echo "-=- container deletion -=-"
                sh "docker rm -f pythoncontainer"
            }
        }
                
        stage('image deletion') {
            steps {
                echo "-=- image deletion -=-"
                sh "docker rmi -f dockerpython"
            }
        }

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
