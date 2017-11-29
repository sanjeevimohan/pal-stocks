1. Install VirtualBox version 5.1.0
2. Install Vagrant version 2.1.2
3. Create Concourse VM
    vagrant init concourse/lite
    vagrant up
4. http://192.168.100.4:8080/
5. Install Fly cli
    Download fly cli from http://192.168.100.4:8080/
    Copy fly to /usr/local/bin
    chmod 777 /usr/local/bin/fly
6. Maven Wrapper
    mvn -N io.takari:maven:wrapper

fly -t concourse-lab login --concourse-url http://192.168.100.4:8080/
fly set-pipeline -t concourse-lab -p pal-stocks -c ci/pipeline.yml -l ci/private.yml
fly unpause-pipeline -t concourse-lab -p pal-stocks
fly trigger-job -t concourse-lab -j pal-stocks/build

xcode-select --install
brew upgrade maven