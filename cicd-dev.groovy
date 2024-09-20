node('linux')
{
  stage ('Poll') {
    checkout([
      $class: 'GitSCM',
      branches: [[name: '*/main']],
      doGenerateSubmoduleConfigurations: false,
      extensions: [],
      userRemoteConfigs: [[url: 'https://github.com/zopencommunity/depot_toolsport.git']]])
  }
  stage('Build') {
    build job: 'Port-Pipeline', parameters: [string(name: 'PORT_GITHUB_REPO', value: 'https://github.com/zopencommunity/depot_toolsport.git'), string(name: 'PORT_DESCRIPTION', value: 'Tools for working with Chromium development. It requires python 3.8' ), string(name: 'BUILD_LINE', value: 'DEV') ]
  }
}
