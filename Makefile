all:
	nasm -f elf64 msg.asm -o msg1.o
	ld -o msg1 msg1.o
	./msg1