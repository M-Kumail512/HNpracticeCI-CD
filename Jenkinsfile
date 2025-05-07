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
                git credentialsId: 'gitHub-cred', url: 'https://github.com/M-Kumail512/HNpracticeCI-CD.git', branch: "${env.BRANCH_NAME}"
            }
        }

        stage('Test') {
            when {
                anyOf {
                    branch 'main'
                    branch 'stage'
                }
            }
            steps {
                echo "🧪 Running tests..."
                sh 'xcodebuild test -project CD.xcodeproj -scheme CD -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 16 Pro"'
            }
        }

        // Temporarily disabled build stage
        /*
        stage('Build') {
            when {
                anyOf {
                    branch 'main'
                    branch 'stage'
                }
            }
            steps {
                echo "🛠️ Skipping build stage for now"
                // sh '... actual build command ...'
            }
        }
        */

        // Temporarily disabled deployment
        /*
        stage('Deploy to TestFlight') {
            when {
                anyOf {
                    branch 'main'
                    branch 'stage'
                }
            }
            steps {
                echo "🚀 Skipping TestFlight upload for now"
                // sh 'fastlane beta'
            }
        }
        */
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
