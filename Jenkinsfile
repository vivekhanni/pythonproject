pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'PythonDevOps', url: 'https://github.com/vivekhanni/pythonproject.git']]])
            }
        }
       
        stage('container deletion') {
            steps {
                echo "-=- container deletion -=-"
                sh "sudo docker rm -f pythoncontainer"
            }
        }
        
        stage('image deletion') {
            steps {
                echo "-=- image deletion -=-"
                sh "sudo docker rmi -f dockerpython"
            }
        }
        
        stage('custom image build') {
            steps {
                echo "-=- custom image build -=-"
                sh "sudo docker build -t dockerpython ."
            }
        }
                
        stage('container run') {
            steps {
                echo "-=- container run -=-"
                sh "sudo docker run -d --name pythoncontainer dockerpython"
            }
        }
                
        stage('expose') {
            steps {
                echo "-=- application publish -=-"
                sh "sudo docker run -p 5000:5000 dockerpython"
            }
        }
    }   
}
