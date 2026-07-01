CC = gcc
CFLAGS = -g -Wall -Iinclude -finput-charset=UTF-8 -fexec-charset=GBK
SRC = src/main.c src/app.c src/common.c src/storage.c src/query.c src/performance.c src/data_generator.c src/list.c src/hash.c
TARGET = build/main.exe

all: $(TARGET)

$(TARGET): $(SRC)
	@if not exist "build" mkdir build
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

clean:
	@if exist "$(TARGET)" del /q "$(TARGET)"

.PHONY: all clean
