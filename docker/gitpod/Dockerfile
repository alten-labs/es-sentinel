#--------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------
# This file contains a custom dock configuration that Gitpod will use for the underlying image for the Gitpod 
# borwser IDE.
# For useful context regarding custom Dockerfiles and images for GitPod see these links:
# https://www.gitpod.io/docs/config-docker
# https://www.gitpod.io/blog/docker-in-gitpod
#--------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------
FROM gitpod/workspace-full

#--------------------------------------------------------------------------------------------------------------
# Install as root.
#--------------------------------------------------------------------------------------------------------------
USER root

RUN mkdir /install

# Install codeql ----------------------------------------------------------------------------------------------
RUN cd /install \
    && wget https://github.com/github/codeql-cli-binaries/releases/download/v2.6.1/codeql-linux64.zip \
    && unzip codeql-linux64.zip \
	&& rm codeql-linux64.zip \
    && mv codeql /home/gitpod/ \
    && echo '##################################### begin add codeql to system path #######################################' >>  /home/gitpod/.bashrc \
    && echo 'export PATH="$HOME/codeql:$PATH"' >>  /home/gitpod/.bashrc \
    && echo '###################################### end add codeql to system path ########################################' >>  /home/gitpod/.bashrc

#--------------------------------------------------------------------------------------------------------------
# Install as gitpod.
#--------------------------------------------------------------------------------------------------------------
USER gitpod

# Install adr-tools -------------------------------------------------------------------------------------------
RUN git clone https://github.com/npryce/adr-tools.git ~/adr-tools \
	&& cd ~/adr-tools && git checkout tags/3.0.0 \
    && echo '################################### begin add adr-tools to system path #####################################' >>  /home/gitpod/.bashrc \
    && echo 'export PATH="$HOME/adr-tools:$PATH"' >>  /home/gitpod/.bashrc \
    && echo '#################################### end add adr-tools to system path ######################################' >>  /home/gitpod/.bashrc

#--------------------------------------------------------------------------------------------------------------
# Return control ot root.
#--------------------------------------------------------------------------------------------------------------
USER root
