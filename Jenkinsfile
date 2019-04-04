node{
      
      stage('SCM Checkout'){
         git 'https://github.com/yogesh1vit/Java-Demo-Application/'
      }
      
      stage('Build'){
         // Get maven home path and build
         def mvnHome =  tool name: 'Maven 3.5.4', type: 'maven'   
         sh "${mvnHome}/bin/mvn package -Dmaven.test.skip=true"
      }       
       
      stage ('Test'){
         def mvnHome =  tool name: 'Maven 3.5.4', type: 'maven'    
         sh "${mvnHome}/bin/mvn verify; sleep 3"
      }
      
      stage('Build Docker Image'){
         sh 'docker build -t yogesh1vit/javademoapp_$JOB_NAME:$BUILD_NUMBER .'
      }  
   
      stage('Publish Docker Image'){
         withCredentials([string(credentialsId: 'dockerpwd', variable: 'Shivi@31')]) {
              sh "docker login -u yogesh1vit -p ${dockerPWD}"
         }
        sh 'docker push yogesh1vit/javademoapp_$JOB_NAME:$BUILD_NUMBER'
        sh "sed -i.bak 's/#BUILD-NUMBER#/$BUILD_NUMBER/' deployment.yaml"
        sh "sed -i.bak 's/#JOB-NAME#/$JOB_NAME/' deployment.yaml"
      }
          
    /*
      // ********* For Azure Cluster**************************
      stage('Deploy'){
         def k8Apply= "kubectl apply -f deployment.yaml" 
         withCredentials([string(credentialsId: 'k8pwd', variable: 'k8PWD')]) {
          sh "sshpass -p ${k8PWD} ssh -o StrictHostKeyChecking=no ubuntu@104.211.154.236" 
          sh "sshpass -p ${k8PWD} scp -r deployment.yaml ubuntu@104.211.154.236:/home/ubuntu" 
          sh "sshpass -p ${k8PWD} ssh  -o StrictHostKeyChecking=no ubuntu@104.211.154.236 ${k8Apply}"
         }
       }
      */
         
       
    
       
      // ********* For AWS Cluster**************************
      stage('Deploy'){
         def k8Apply= "kubectl apply -f deployment.yaml" 
         withCredentials([string(credentialsId: 'devops', variable: 'Dev0p\$!!/')]) {
             sh "sshpass -p ${k8PWD} ssh -o StrictHostKeyChecking=no devops@34.236.171.195"  
             sh "sshpass -p ${k8PWD} scp -r deployment.yaml devops@34.236.171.195:/home/devops" 
             sh "sshpass -p ${k8PWD} ssh -o StrictHostKeyChecking=no devops@34.236.171.195 ${k8Apply}"
         }
       }
        
  }
