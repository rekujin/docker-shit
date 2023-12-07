FROM node:latest

WORKDIR /app

RUN npm install -g prettier

RUN git clone https://github.com/rekujin/wtf .

RUN npm install

RUN npx prettier --write "*.js"

COPY . .

RUN npm install

CMD ["npm", "start"]

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:3000 || exit 1
