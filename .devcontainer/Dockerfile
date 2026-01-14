FROM amazonlinux:2023

# Dev Container接続に必要: tar, flock(util-linux)
# 開発に必要: git, which
# curl-minimal と curl は競合するので swap で curl に統一
RUN dnf -y update && \
    dnf -y install tar util-linux git which && \
    dnf -y swap curl-minimal curl && \
    dnf clean all

# Node.js 20 LTS を導入
RUN curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - && \
    dnf -y install nodejs && \
    node -v && npm -v && \
    dnf clean all

WORKDIR /workspaces
