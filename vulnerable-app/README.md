# Victim Machine 

## Setting Up Environment

### Install Java 8u181
Configure your system to use the version `8u181` of Oracle Java SE 8 JDK. 
Applications running with Java versions prior to `8u191` can be easily exploited, so we have chosen to work with one of the earliest versions of java 8: `java-8u181`.
Oracle thankfully provides an archive for all previous java versions: https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html.

1. Go to Oracle Java SE Downloads, scroll down to `8u181`, accept the license agreement and download the installer for your operating system.

2. Make a directory for the JDK.
```bash
$ sudo mkdir -p /usr/lib/jvm
```

3. Extract the tarball and install the JDK.
```bash
$ sudo tar zxf jdk-8u181-linux-x64.tar.gz -C /usr/lib/jvm
```

4. Set the new JDK as the default.
```bash
$ sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_181/bin/java" 1
$ sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_181/bin/java
```

### Install Tomcat
Apache Tomcat is an open-source implementation of the Java Servlet, JavaServer Pages, Java Expression Language, and WebSocket technologies. Tomcat provides a Java HTTP web server environment in which Java code can run.

1. Download Tomcat from source.
```bash
$ wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz
```

2. Make a directory for Tomcat.
```bash
$ mkdir /etc/tomcat
```

3. Extract the tar file to the `/etc/tomcat` directory.
```bash
$ tar -xf apache-tomcat-9.0.58.tar.gz -C /etc/tomcat/
```

4. Make the script executable.
```bash
$ sh -c ‘chmod +x /etc/tomcat/bin/*.sh’
```

### Install Maven
Maven is a build automation tool used for Java projects.
If you don’t have it already, you can easily install it using this command: 
```bash
$ apt install maven
```

## Deploy the Application

1. Go to the app directory.
```bash
$ cd vulnerable-app
```

2. Build the application.
```bash
$ mvn package
```

3. Copy application to Tomcat directory.
```bash
$ cp ./target/log4shell-1.0.war /etc/tomcat/webapps/ROOT.war
```

4. Start the Tomcat HTTP Server.
```bash
$ sudo bash /etc/tomcat/bin/catalina.sh run
```

5. Check the service. You should now be able to go to your VM’s IP at port 8080 with in your web browser and see your app running.