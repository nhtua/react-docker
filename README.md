# React-Docker

> Read [Vietnamese version](./README-vn.md).
> Đọc [phiên bản Tiếng Việt](./README-vn.md). 

This is a demo for packaging and deploying a ReactJS project. App's source code was generated from command:

```
npx create-react-app
```

It would help you understand how to apply Docker into a ReactJS project.


## Packaging ReactJs with Docker

Run command

```
docker build -t nhtua/react-docker .
```

I would like to explain more about the way Dockerfile works. In this project, Dockerfile is using a feature called multi-stage build which is available from Docker 1.17. With this setup, Dockerfile has two stages.

First stage, it use the based-image Node:14 to run the build command

```
npm install && npm run build
```
After build completed, all the assets file like html, css and js are placed in `/app/build`.

The second stage, it use based-image Nginx to serve the static html as a web server. Dockerfile would copy the build from `/app/build` into `/usr/share/nginx/html` which is the default directly for serving a static website.

In general, we use Nginx to run the web server for ReactJs, which absolutely optimizes for serving static html files and it's better than using `npm start` in development mode.

## Deploy react-docker

There are two important files:

-  `docker-compose.yaml` which declare how to run `react-docker` as a container.
- `deploy.sh` is a utility script that helps deploying the latest react-docker image.

So to deploy, simply run command:
```
./deploy.sh
```
