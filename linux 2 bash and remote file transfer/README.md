# Making a bash script
## a bash script is an ordered set of linux commands to be run
![Alt text](images/image.png)
## the bash script always srats with the part at the top which says what is used to run the script
## sudo runs as super users, su(-per)do 
## systemctl is system control

## if it runs an new machiens its idempotent, it runs on a fresh machine, it runs on a fresh machine
![Alt text](images/image2.png)

## environment varaibles are oftne used to hold senstive data, our java rpograms will access data from those environment variables.

## how to sort out kernel user interaction, bad for automation
## despite having -y in commnd
## maven also asks about user input
### to bypass user input DEBIAN_FRONTEND=noninteractive
## scp -i ~/.ssh/tech242.pem ~/Documents/sendthisover.txt ubuntu@ec2-34-241-219-7.eu-west-1.compute.amazonaws.com:~
##
![Alt text](image.png)

```
#!/bin/bash

# update
echo "updating ..."
sudo apt update -y
echo "done"
echo ""
# upgrade
echo "upgrading..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "done"
echo ""
# install maven
echo "installing maven..."
sudo DEBIAN_FRONTEND=noninteractive apt install maven -y
echo "done"
echo ""
# check maven
echo "checking maven..."
mvn -version
echo "done"
echo ""
# install JDK java 17
echo "installing java 17..."
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y
echo "done"
echo ""
# check JDK 17
echo "checking java 17..."
java -version
javac -version
echo "done"
echo ""
# install git
echo "installing git..."
sudo DEBIAN_FRONTEND=noninteractive apt install git -y
echo "done"
echo ""
# check git
echo "checking git..."
git --version
echo "done"
echo ""
# git clone repo
echo "cloning repo..."
cd ~
git clone https://github.com/Piasttorun/tech242-jsonvoorhees-app repo
echo "done"
echo ""
## run
echo "running..."
cd ~/repo/springapi/
mvn spring-boot:start
echo "done"
echo ""
```
## To explain this code it updates, DEBIAN_FRONTEND disallows the output of a new window
## we always check --versions for debuging reasons
## this code made a working repo