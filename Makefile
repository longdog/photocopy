NAME=photocopy
VERSION?=dev
BUILD_NAME=$(GOOS)-$(GOARCH)
BUILD_DIR=build/$(BUILD_NAME)

ifeq ($(GOOS),windows)
  ext=.exe
  archiveCmd=zip -9 -r $(NAME)-$(BUILD_NAME)-$(VERSION).zip $(BUILD_NAME)
else
  ext=
  archiveCmd=tar czpvf $(NAME)-$(BUILD_NAME)-$(VERSION).tar.gz $(BUILD_NAME)
endif

.PHONY: default
default: build

build: clean
	go build

clean:
	go clean
	-rm -rf $(BUILD_DIR)

release:
	-mkdir -p $(BUILD_DIR)
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -ldflags "-X main.version=$(VERSION)" -o $(BUILD_DIR)/$(NAME)$(ext)
	cd build ; $(archiveCmd)