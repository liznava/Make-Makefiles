#/**
# * @file Makefile
# * @author Lizette Navarrete
# * @date 2025-02-17
# * @brief Makefile for employee
# * 
# * Creates a makefile for Employee class and its derived classes, Officer and Supervisor
# */


# Purpose: Makefile to compile and link Employee Management System

# Compiler
CC = g++

# Target executable
TARGET = employee

# Compiles with all warnings and errors
CFLAGS = -Wall -Wextra

#Target is its only dependacy
all: $(TARGET)

# Link all of them together
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) -o $(TARGET) main.o Employee.o Officer.o Supervisor.o

# Compile main.o from main.cpp
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) -c main.cpp

# Compile Employee.o from Employee.cpp
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) -c Employee.cpp

# Compile Officer.o from Officer.cpp
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) -c Officer.cpp

# Compile Supervisor.o from Supervisor.cpp
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) -c Supervisor.cpp

# Removes all objects (*.o), Emacs backups (*~), and the target
clean:
	rm -f main.o Employee.o Officer.o Supervisor.o $(TARGET) *~~
