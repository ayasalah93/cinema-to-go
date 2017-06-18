  node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
 	
	sh 'docker-compose up -d'

 //       app = docker.build("aboubakr/movies")


    }

     stage('Test image') {
        app.inside {
	   sh 'echo "tests passed"'
            sh 'curl http://127.0.0.1:80 || exit 1'
        }
    }   

    stage('Push image') {
       
     
   docker.withRegistry("https://registry.hub.docker.com", 'docker-hub-credential') {

            app.push("${env.BUILD_NUMBER}")
	   app.push("latest") 
            
        }
    }
}
