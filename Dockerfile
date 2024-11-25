# 1. Use a minimal Red Hat UBI base image
FROM redhat/ubi8-minimal

# 2. Set Maintainer Label
LABEL maintainer="dhruv"

# 3. Install Apache and clean up unnecessary files
RUN microdnf install httpd && \
    microdnf clean all && \
    rm -rf /var/cache/yum

# 4. Copy website files and directories
COPY index.html /var/www/html/
COPY portfolio.html /var/www/html/
COPY about.html /var/www/html/
COPY contact.html /var/www/html/
COPY resume.html /var/www/html/
COPY services.html /var/www/html/
COPY ./css /var/www/html/css
COPY ./js /var/www/html/js
COPY ./fonts /var/www/html/fonts
COPY ./docs /var/www/html/docs
COPY ./img /var/www/html/img

# 5. Set Entrypoint to run Apache in the foreground
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# 6. Expose port 80
EXPOSE 80
