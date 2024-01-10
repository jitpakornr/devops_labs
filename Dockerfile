FROM nginx:alpine
LABEL org.opencontainers.image.source="https://github.com/jitpakornr/devops_labs https://github.com/jitpakornr/next-auth-example"
COPY ./html /usr/share/nginx/html
