pipeline {
    agent { label 'prod-slave' } 
    stages {
        stage('Build Image') {
            steps {
                 sh "docker image build -t faizu6/ansible:${currentBuild.number} ."
            }
        }
        stage('login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-user-pass', passwordVariable: 'password', usernameVariable: 'username')]) {
                 sh '''
                    docker login --username=$username --password=$password
                    '''
                }
            }
        }
        stage('push-image') {
            when {
            branch "main"
        }
            steps {
                sh '''
                   docker push faizu6/ansible:${currentBuild.number}
                   '''
                }
            }
       }
       post { 
        always { 
            sh '''
            docker logout faizu6
            '''
        }
    }
}
