FROM ubuntu:16.04

RUN apt-get -qq update && apt-get -qq install -y \
    unzip \
    wget \
	bc \
	libxpm4 libxext6 libxt6 libxmu6 && \
	wget ftp.us.debian.org/debian/pool/main/libx/libxp/libxp6_1.0.2-2_amd64.deb && \
	dpkg -i libxp6_1.0.2-2_amd64.deb && \
	rm -f libxp6_1.0.2-2_amd64.deb

# Install Mathlab Compiler Runtime
RUN wget --progress=bar:force https://www.fil.ion.ucl.ac.uk/spm/download/restricted/utopia/MCR/glnxa64/MCRInstaller.bin && \
  chmod 755 MCRInstaller.bin && \
  ./MCRInstaller.bin -P bean421.installLocation="MCR" -silent && \
  rm -f MCRInstaller.bin
  
# Download and init SPM standalone
RUN wget --progress=bar:force --no-check-certificate -P spm https://www.fil.ion.ucl.ac.uk/spm/download/restricted/utopia/spm12_r7771.zip && \
  unzip /spm/spm12_r7771.zip && \
  rm -f spm12_r7771.zip && \
  ./spm12/run_spm12.sh /MCR/v713/ quit

ENTRYPOINT ["/spm12/run_spm12.sh", "/MCR/v713/"]