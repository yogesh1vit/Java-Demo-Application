node{
      
      stage('Checkout'){
         git 'https://github.com/rajnikhattarrsinha/Java-Demo-Application'
      }
  
      stage ('Test'){
         def mvnHome =  tool name: 'Maven 3.5.4', type: 'maven'    
         sh "${mvnHome}/bin/mvn verify; sleep 3"
      }
      stage('Build'){
         // Get maven home path and build
         def mvnHome =  tool name: 'Maven 3.5.4', type: 'maven'   
         sh "${mvnHome}/bin/mvn package"
      }    
      
      stage('Build Docker Image'){
         sh 'docker build -t rajnikhattarrsinha/javademoapp3:1.0.0 .'
      }  
   
      stage('Publish Docker Image')
      {
         withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerPWD')]) {
              sh "docker login -u rajnikhattarrsinha -p ${dockerPWD}"
         }
        sh 'docker push rajnikhattarrsinha/javademoapp3:1.0.0'
      }
      stage('Copy deploy file')
      {
         withCredentials([string(credentialsId: 'k8pwd', variable: 'k8PWD')]) {
               //sh "sshpass -p ${k8PWD} ssh ubuntu@104.211.188.12"
               sh "sshpass -p ${k8PWD} scp -r deployment.yaml ubuntu@104.211.188.12:/home/ubuntu"
         }
       // sh 'scp deployment.yaml ./home/ubuntu'
      }
      
    /*   stage('Copying Deployment yaml') {  
           def cmdTest='pwd'
           //export SSHPASS='Alpha#757575'
           sshagent(['1022304b-5e99-420d-82de-677aaa255a08']) { 
                 //sh "export SSHPASS='Alpha#757575'"
                 sh "sshpass -e ssh -o StrictHostKeyChecking=no ubuntu@104.211.188.12 ${cmdTest}"
                 //sh "ssh -o StrictHostKeyChecking=no ubuntu@104.211.188.12 ${cmdTest}"
               //sh 'scp deployment.yaml ubuntu@104.211.188.12'         
           }
      }*/
      /*stage('Deploy'){        
            //def dockerContainerName = 'javademo-$BUILD_NUMBER'
            def k8Apply= "kubectl apply -f deployment.yaml"         
            sshagent(['k8server']) { 
              sh "ssh ubuntu@104.211.188.12 ${k8Apply}"                   
         }
      }
     */

   /*stage('Stop running containers'){        
         def listContainer='sudo docker ps'
         def scriptRunner='sudo ./stopscript.sh'
         def stopContainer='sudo docker stop $(docker ps -a -q)'
        sshagent(['dockerdeployserver2']) {
              sh "ssh -o StrictHostKeyChecking=no ubuntu@18.215.68.236 ${scriptRunner}"
            //sh "ssh -o StrictHostKeyChecking=no ubuntu@18.215.68.236 ${stopContainer}"
              //sh "ssh -o StrictHostKeyChecking=no ubuntu@18.215.68.236 ${dockerRun}"
            //sh '''ssh -o StrictHostKeyChecking=no ubuntu@18.215.68.236 ${stopContainer}'''
           // docker stop $(docker ps -a -q)
           // ${dockerRun}
           // '''
               //sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.215.68.236'
              // sh "docker ps -f name=${dockerContainerTobeDeleted} -q | xargs --no-run-if-empty docker container stop"
              // sh "docker container ls -a -fname=${dockerContainerTobeDeleted} -q | xargs -r docker container rm"
               //sh 'sudo docker stop "${(docker ps -a)}"'
               //sh 'docker rm `docker ps --all`'
              // sh "docker stop ${dockerContainerTobeDeleted}"
               //sh "${dockerRun}"         
         }
   } 
      stage('Pull Docker Image and Deploy'){        
            def dockerContainerName = 'javademo-$BUILD_NUMBER'
            def dockerRun= "sudo docker run -p 8080:8080 -d --name ${dockerContainerName} rajnikhattarrsinha/javademo:2.0.0"         
            sshagent(['dockerdeployserver2']) {
              sh "ssh -o StrictHostKeyChecking=no ubuntu@18.215.68.236 ${dockerRun}"
                   
         }
   }
   */
   
   
}
