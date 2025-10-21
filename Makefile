# ============================
# Go Conditional Build Demo
# ============================

APP_NAME := app
PKG := go-conditional-demo
BUILD_DIR := bin

# 默认 GO 构建选项
GO ?= go
GOOS ?= $(shell go env GOOS)
GOARCH ?= $(shell go env GOARCH)

# 清理
clean:
	@echo "🧹 Cleaning..."
	@rm -rf $(BUILD_DIR)

# Debug 构建
build-debug:
	@echo "⚙️  Building Debug for $(GOOS)/$(GOARCH)..."
	@mkdir -p $(BUILD_DIR)
	@GOOS=$(GOOS) GOARCH=$(GOARCH) $(GO) build -tags debug -o $(BUILD_DIR)/$(APP_NAME)-$(GOOS)-debug .

# Release 构建
build-release:
	@echo "🚀 Building Release for $(GOOS)/$(GOARCH)..."
	@mkdir -p $(BUILD_DIR)
	@GOOS=$(GOOS) GOARCH=$(GOARCH) $(GO) build -o $(BUILD_DIR)/$(APP_NAME)-$(GOOS)-release .

# 测试所有模式
test-all:
	@echo "🧪 Running Debug tests..."
	@$(GO) test -tags debug ./logger -v
	@echo ""
	@echo "🧪 Running Release tests..."
	@$(GO) test ./logger -v

# 一键全构建（Linux + macOS）
build-all:
	@echo "🏗️ Building all platforms..."
	@GOOS=linux GOARCH=amd64 $(GO) build -tags debug -o $(BUILD_DIR)/$(APP_NAME)-linux-debug .
	@GOOS=linux GOARCH=amd64 $(GO) build -o $(BUILD_DIR)/$(APP_NAME)-linux-release .
	@GOOS=darwin GOARCH=arm64 $(GO) build -tags debug -o $(BUILD_DIR)/$(APP_NAME)-darwin-debug .
	@GOOS=darwin GOARCH=arm64 $(GO) build -o $(BUILD_DIR)/$(APP_NAME)-darwin-release .

.PHONY: clean build-debug build-release test-all build-all
