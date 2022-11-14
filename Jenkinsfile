pipeline {
    agent { any } 
    stages {
        stage('Build Image') {
            steps {
                 sh "docker image build -t faizu6/ansible-img1:${BUILD_NUMBER} ."
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
                  docker push faizu6/ansible-img1:${BUILD_NUMBER}
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
