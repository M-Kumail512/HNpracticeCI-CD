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
                echo "🧪 (Simulated) Running tests..."
                // Simulate test success
            }
        }

        stage('Build') {
            when {
                anyOf {
                    branch 'main'
                    branch 'stage'
                }
            }
            steps {
                echo "🛠️ (Simulated) Building the iOS project..."
                // Simulate build success
            }
        }

        stage('Deploy to TestFlight') {
            when {
                anyOf {
                    branch 'main'
                    branch 'stage'
                }
            }
            steps {
                echo "🚀 (Simulated) Uploading build to TestFlight..."
                // Simulate deployment success
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
