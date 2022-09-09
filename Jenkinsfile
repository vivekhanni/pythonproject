pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'PythonDevOps', url: 'https://github.com/vivekhanni/pythonproject.git']]])
            }
        }
        stage('BUILD') {
            steps {
                sh 'python python.py'
                
            }
        }
    }
}
