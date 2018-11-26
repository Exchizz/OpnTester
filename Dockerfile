FROM eabay/nodejs
RUN npm install -g newman
RUN apt-get update && apt install perl -y
COPY test.sh /
COPY OPN-takehome.postman_collection.json /
RUN chmod +x /test.sh


# Might need parameters to test.sh at some point
ENTRYPOINT ["/test.sh"]
CMD []
