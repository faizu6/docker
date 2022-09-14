pipeline {
    agent { label 'prod-slave' } 
    stages {
        stage('Build Image') {
            steps {
                sh "docker image build -t customimage ."
            }
        }
    }
}
