FROM eabay/nodejs
RUN npm install -g newman
RUN apt-get update && apt install perl -y
COPY test.sh /
COPY OPN-takehome.postman_collection.json /
RUN chmod +x /test.sh


ENTRYPOINT ["/test.sh"]
CMD []
