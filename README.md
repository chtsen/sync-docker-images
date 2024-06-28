# 同步镜像到 Docker Hub 或阿里云示例

此仓库包含一个 GitHub Actions 工作流，用于将 Docker 镜像同步到 Docker Hub 或阿里云容器镜像服务。该工作流可以在推送到 `main` 分支或对 `main` 分支的拉取请求时触发。

## 工作流详情

### 触发器

- **push**: 在推送到 `main` 分支时触发。
- **pull_request**: 在对 `main` 分支的拉取请求时触发。

### 作业

#### 构建和同步作业

此作业执行以下步骤：

1. **Git pull**: 将仓库检出到运行器。
2. **设置 Docker Buildx**: 设置 Docker Buildx 以构建多平台镜像。
3. **安装更新的 Skopeo**: 安装更新版本的 Skopeo，这是一个用于操作容器镜像和容器镜像仓库的工具。
4. **登录到阿里云容器镜像服务**: 使用存储在 GitHub Secrets 中的凭据登录到阿里云容器镜像服务。
5. **使用 Skopeo 同步镜像到 Docker Hub**: 运行脚本使用 Skopeo 同步镜像。

## 如何使用

### 先决条件

1. **GitHub Secrets**: 确保您已将必要的秘密添加到您的 GitHub 仓库：
   - `DOCKER_ALIYUN_USER`: 您的阿里云容器镜像服务用户名。
   - `DOCKER_ALIYUN_PW`: 您的阿里云容器镜像服务密码。

2. **脚本**: 确保仓库中存在 `script/sysnc-images.sh` 脚本。此脚本应包含使用 Skopeo 同步镜像的命令。

### 示例 `workflow_dispatch` 输入

当前工作流不使用 `workflow_dispatch` 输入，但您可以扩展其以支持手动触发和自定义输入。
