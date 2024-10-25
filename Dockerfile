# The FROM command specifies the base image to use when creating a new image.
# Here, 'redhat/ubi8' is used as the base image.
#1.Base Image:
FROM redhat/ubi8
#2. Set Maintainer Label:
# The LABEL command adds metadata to the image. 
# Here, the maintainer's information is set to 'kjavaman'.
LABEL maintainer="dhruv"
#3. Install Apache Web Server:
# The RUN command executes commands during the image build process. 
# Here, it installs the 'httpd' web server.
RUN yum -y install httpd
#4. Copy HTML File:
# The COPY command copies files or directories from the host system to the image's file system.
# Here, it copies the 'index.html' file to the container's '/var/www/html/' location.
COPY index.html /var/www/html/
#5.Set Entrypoint:
# The ENTRYPOINT command specifies the command to run when the container starts.
# Here, it runs the Apache HTTP server in FOREGROUND mode.
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#6. Expose Port:
# The EXPOSE command specifies the ports that the container will listen on.
# In this case, port 80 is used to receive HTTP requests.
EXPOSE 80