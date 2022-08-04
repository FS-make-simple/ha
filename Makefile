############################################################################
#  This file is part of HA, a general purpose file archiver.
#  Copyright (C) 1995 Harri Hirvola
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
############################################################################
#	Makefile for HA/gcc
############################################################################

TARGET = ha

CC ?= gcc
CFLAGS ?= -Wall -O2
LDFLAGS ?= $(CFLAGS) -s

SRCS = src/acoder.c \
       src/archive.c \
       src/asc.c \
       src/cpy.c \
       src/error.c \
       src/haio.c \
       src/hsc.c \
       src/info.c \
       src/machine.c \
       src/misc.c \
       src/swdict.c \
       src/ha.c
OBJS = $(SRCS:%.c=%.o)
RM ?= rm -f

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $^ -o $@

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean: 
	$(RM) $(TARGET) $(OBJS)

install: $(TARGET)
	mkdir -p $(DESTDIR)/usr/bin
	cp -v $(TARGET) $(DESTDIR)/usr/bin/
