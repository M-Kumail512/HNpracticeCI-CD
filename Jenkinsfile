pipeline {
    agent any

    environment {
        PROJECT_NAME = "CD"                      // Your .xcodeproj name
        SCHEME = "CD"                            // Scheme to build
        DESTINATION = "generic/platform=iOS"     // Simulator platform
        GITHUB_CREDENTIALS_ID = 'your-credentials-id' // Replace with the ID of your GitHub credentials in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                echo "🔄 Checking out branch: ${env.BRANCH_NAME}"
                checkout scm: [
                    $class: 'GitSCM',
                    branches: [[name: "*/${env.BRANCH_NAME}"]],
                    userRemoteConfigs: [[
                        url: 'https://github.com/M-Kumail512/HNpracticeCI-CD.git',
                        credentialsId: "${GITHUB_CREDENTIALS_ID}"
                    ]]
                ]
            }
        }

        stage('Build') {
            when {
                branch 'main'
            }
            steps {
                echo "🛠️ Building the iOS project..."
                sh """
                xcodebuild clean build \
                -project ${PROJECT_NAME}.xcodeproj \
                -scheme ${SCHEME} \
                -destination '${DESTINATION}' \
                CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
                """
            }
        }
    }

    post {
        success {
            echo "✅ Build succeeded for ${env.BRANCH_NAME}"
        }
        failure {
            echo "❌ Build failed on ${env.BRANCH_NAME}"
        }
    }
}
