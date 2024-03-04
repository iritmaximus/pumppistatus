FROM alpine AS builder

RUN echo "hi :)"
CMD ["echo", "hi"]
