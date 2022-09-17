pipeline {
    agent { label 'prod-slave' } 
    stages {
        stage('Build Image') {
            steps {
                 sh "docker image build -t faizu6/ansible:${Build_number} ."
            }
        }
        stage('login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker-user-pass', passwordVariable: 'password', usernameVariable: 'username')]) {
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
