pipeline {
    agent none 
    stages {
        stage('Build Image') {
            steps {
                sh "docker image build -t customimage ."
            }
        }
    }
}
