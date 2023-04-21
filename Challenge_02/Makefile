ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main_os.img: $(BUILD_DIR)/main.bin
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_os.img
	truncate -s 512 $(BUILD_DIR)/main_os.img
	./run


$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin
