pipeline {
    agent any
    
    stages{
        stage("Code"){
            steps{
             git url: "https://github.com/AniketGirigoud/SPCL-Project.git", branch:"main"
             echo "code succesfully clone"
            }
        }
        stage("Build and Test"){
            steps{
             sh "whoami"
             sh "docker build -t aniketgirigoud:latest ."
             echo "build is success"
            }
        }
        stage("Push the Code"){
            steps{
            echo "login and pushing the code"
            withCredentials([usernamePassword(credentialsId:"dockerhubid",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                 sh "docker image tag aniketgirigoud:latest ${env.dockerHubUser}/spcl-project:latest"
                 sh "docker push ${env.dockerHubUser}/spcl-project:latest"
                 echo " push was successfull"
             }
            }
        }
        stage("Deploy"){
            steps{
             sh "docker run -d -p 8000:8000 aniketgirigoud/spcl-project:latest"
            }
        }
    }
    
}
