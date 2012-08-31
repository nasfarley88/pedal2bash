###########################################
# Simple Makefile for HIDAPI test program
#
# Alan Ott
# Signal 11 Software
# 2010-06-01
###########################################

all: hidtest

CC=gcc
CXX=g++
COBJS=hid.o
CPPOBJS=hidtest.o
OBJS=$(COBJS) $(CPPOBJS)
CFLAGS=-I../hidapi -Wall -g -c `pkg-config libusb-1.0 --cflags`
LIBS=-ludev -lrt -lpthread `pkg-config libusb-1.0 --libs`


hidtest: $(OBJS)
	g++ -Wall -g $^ $(LIBS) -o hidtest

$(COBJS): %.o: %.c
	$(CC) $(CFLAGS) $< -o $@

$(CPPOBJS): %.o: %.cpp
	$(CXX) $(CFLAGS) $< -o $@

clean:
	rm *.o hidtest

.PHONY: clean
