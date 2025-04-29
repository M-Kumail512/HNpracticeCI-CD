pipeline {
    agent any

    environment {
        PROJECT_NAME = "CD"
        SCHEME = "CD"
        DESTINATION = "generic/platform=iOS"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "🔄 Checking out branch: ${env.BRANCH_NAME}"
                git credentialsId: 'gitHub-cred', url: 'https://github.com/M-Kumail512/HNpracticeCI-CD.git', branch: 'main'
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

        stage('Deploy to TestFlight') {
            when {
                branch 'main'
            }
            steps {
                echo "🚀 Uploading build to TestFlight..."
                // If you're using Bundler, replace with: bundle exec fastlane beta
                sh 'fastlane beta'
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
