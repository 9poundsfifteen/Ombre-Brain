# ============================================================
# 阴影大脑 Docker 构建
# Docker 构建文件
#
# 构建：docker build -t ombre-brain .
# 运行：docker run -e OMBRE_API_KEY=your-key -p 8000:8000 ombre-brain
# ============================================================

FROM python:3.12-slim

WORKDIR /app

# 先安装依赖项（利用Docker缓存）
# 先安装依赖（利用 Docker 缓存）
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目文件 / 复制项目文件
复制*.py .

复制config.example.yaml ./config.yaml

# 持久化挂载点：bucket数据
# 持久化挂载点：记忆数据

# 默认使用可流式处理的http协议（远程访问）
# 容器场景默认使用 streamable-http
环境变量OMBRE_TRANSPORT=streamable-http
环境变量OMBRE_BUCKETS_DIR=/app/buckets

暴露 8000

命令 ["python", "server.py"]
