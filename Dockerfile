# Dockerfile for building Mastering EVM (2025 Edition)
# Uses pandoc with LaTeX for PDF/EPUB generation

FROM pandoc/extra:latest

# Install additional fonts
RUN apk add --no-cache \
    font-dejavu \
    fontconfig

# Set working directory
WORKDIR /book

# Default command
CMD ["sh", "-c", "echo 'Use: docker run -v $(pwd):/book evmbook build-pdf|build-epub|build-all'"]
