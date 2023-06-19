Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C16E734A93
	for <lists+linux-clk@lfdr.de>; Mon, 19 Jun 2023 05:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjFSDXr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 18 Jun 2023 23:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjFSDXo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Jun 2023 23:23:44 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BAAE4C;
        Sun, 18 Jun 2023 20:23:41 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b5422163f4so16664485ad.2;
        Sun, 18 Jun 2023 20:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687145020; x=1689737020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb5P74JWzUnwYvyNqjmfPIrmNhPgChjwJpwY7M/rqOM=;
        b=KwPo4I9IiKQhVvkTLpck1t4zIQJMCMavanloOsT+Ue1uhKj8WGwPCuPMHI9hZun4dh
         JUCn2X3hspDmcnjq3CXdYTzCABKn4Psv063wKHvPWmcwMUNsjs4Tu/sAj51VJbaPDgdU
         ludfuCDX7HSzKx4aSONueY0ApQsc8HMT0pz+1Wtf9qSwxd5T7SAe8v3mHsoLUV3PPZfl
         cBtbFV8x4ginj+EKZq8eb14szLI6K9Nfqzupw0zHg81cnRDyYVlEgf7MOpUmo0ce4ReN
         rlyOEpp8fedfosFrs2GuOaJ262+uT6/fmPazYd16ub3uyCduc7vwUnhtmuQuMXBO+lEu
         feeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687145020; x=1689737020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb5P74JWzUnwYvyNqjmfPIrmNhPgChjwJpwY7M/rqOM=;
        b=CRC7YwsBQnlzgIO6yuljBOH3s2cuVQUh/CvpTJgF0KJO1fjsYGUYqHu7rjTEiPq5kT
         TILFcuqIWvhXAGcLCQzA6NX1OnEqXZHlWjIeY0LGIo+2Xn4T0J7M7AZizPysqoufLLlh
         h7y6V5RV2F4vv6N9Zk6KfhYUdx7lPUyBGPvTuJAsmgL5vFUcRb+mkWdc7gEe/iZ6hTad
         wtr2/QM7LKwmyZKAaoPmLEVffvogj5QIc32rzcPwVYprWsyQXFRx2SUXCrYcBRBKYoq4
         GiktonXgpT09f/TyO43FhyFUw8jx6XJeZQIqhe2aRHiw+5blforQJ1t2MDWRseH4NAms
         FE2A==
X-Gm-Message-State: AC+VfDzWp14KnQdOVBlf1/IaXtC3692bpSJaqFyG+si1KaRbXcVtE1Nb
        hTtEu+oBsu7tyLuqnVQTS54=
X-Google-Smtp-Source: ACHHUZ5jdehH7c0OLzPLETUC/IIowJig+mMXu0dMrmfP4xPvqgUqoDIW9XvjfZ6ISAMerG1ASJOMDg==
X-Received: by 2002:a17:902:c944:b0:1b0:6038:2982 with SMTP id i4-20020a170902c94400b001b060382982mr10004926pla.41.1687145020115;
        Sun, 18 Jun 2023 20:23:40 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001a4fecf79e4sm19329817plh.49.2023.06.18.20.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 20:23:39 -0700 (PDT)
From:   Jacky Huang <ychuang570808@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, tmaimon77@gmail.com, catalin.marinas@arm.com,
        will@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org,
        schung@nuvoton.com, mjchen@nuvoton.com,
        Jacky Huang <ychuang3@nuvoton.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v15 1/2] tty: serial: Add Nuvoton ma35d1 serial driver support
Date:   Mon, 19 Jun 2023 03:23:29 +0000
Message-Id: <20230619032330.233796-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619032330.233796-1-ychuang570808@gmail.com>
References: <20230619032330.233796-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jacky Huang <ychuang3@nuvoton.com>

This adds UART and console driver for Nuvoton ma35d1 Soc.
It supports full-duplex communication, FIFO control, and
hardware flow control.
Command line set "console=ttyNVT0,115200", NVT means
Nuvoton MA35 UART port. The UART driver probe will
create path named "/dev/ttyNVTx".

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/tty/serial/Kconfig         |  23 +
 drivers/tty/serial/Makefile        |   1 +
 drivers/tty/serial/ma35d1_serial.c | 821 +++++++++++++++++++++++++++++
 3 files changed, 845 insertions(+)
 create mode 100644 drivers/tty/serial/ma35d1_serial.c

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 3e3fb377d90d..444a31ff18b5 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1555,6 +1555,29 @@ config SERIAL_SUNPLUS_CONSOLE
 	  you can alter that using a kernel command line option such as
 	  "console=ttySUPx".
 
+config SERIAL_NUVOTON_MA35D1
+	tristate "Nuvoton MA35D1 family UART support"
+	depends on ARCH_MA35 || COMPILE_TEST
+	select SERIAL_CORE
+	help
+	  This driver supports Nuvoton MA35D1 family UART ports. If you would
+	  like to use them, you must answer Y or M to this option. Note that
+	  for use as console, it must be included in kernel and not as a
+	  module. If you enable this option, Ma35D1 serial ports in the system
+	  will be registered as ttyNVTx.
+
+config SERIAL_NUVOTON_MA35D1_CONSOLE
+	bool "Console on a Nuvotn MA35D1 family UART port"
+	depends on SERIAL_NUVOTON_MA35D1=y
+	select SERIAL_CORE_CONSOLE
+	help
+	  Select this options if you'd like to use the UART port0 of the
+	  Nuvoton MA35D1 family as a console.
+	  Even if you say Y here, the currently visible virtual console
+	  (/dev/tty0) will still be used as the system console by default,
+	  but you can alter that using a kernel command line option such as
+	  "console=ttyNVTx".
+
 endmenu
 
 config SERIAL_MCTRL_GPIO
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index cd9afd9e3018..0e823851c42c 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -93,3 +93,4 @@ obj-$(CONFIG_SERIAL_MCTRL_GPIO)	+= serial_mctrl_gpio.o
 
 obj-$(CONFIG_SERIAL_KGDB_NMI) += kgdb_nmi.o
 obj-$(CONFIG_KGDB_SERIAL_CONSOLE) += kgdboc.o
+obj-$(CONFIG_SERIAL_NUVOTON_MA35D1) += ma35d1_serial.o
diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
new file mode 100644
index 000000000000..2604b4d9fb78
--- /dev/null
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -0,0 +1,821 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  MA35D1 serial driver
+ *  Copyright (C) 2023 Nuvoton Technology Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/iopoll.h>
+#include <linux/serial_core.h>
+#include <linux/slab.h>
+#include <linux/tty_flip.h>
+#include <linux/units.h>
+
+#define MA35_UART_NR		17
+
+#define MA35_RBR_REG		0x00
+#define MA35_THR_REG		0x00
+#define MA35_IER_REG		0x04
+#define MA35_FCR_REG		0x08
+#define MA35_LCR_REG		0x0C
+#define MA35_MCR_REG		0x10
+#define MA35_MSR_REG		0x14
+#define MA35_FSR_REG		0x18
+#define MA35_ISR_REG		0x1C
+#define MA35_TOR_REG		0x20
+#define MA35_BAUD_REG		0x24
+#define MA35_ALTCTL_REG		0x2C
+#define MA35_FUN_SEL_REG	0x30
+#define MA35_WKCTL_REG		0x40
+#define MA35_WKSTS_REG		0x44
+
+/* MA35_IER_REG - Interrupt Enable Register */
+#define MA35_IER_RDA_IEN	BIT(0)  /* RBR Available Interrupt Enable */
+#define MA35_IER_THRE_IEN	BIT(1)  /* THR Empty Interrupt Enable */
+#define MA35_IER_RLS_IEN	BIT(2)  /* RX Line Status Interrupt Enable */
+#define MA35_IER_RTO_IEN	BIT(4)  /* RX Time-out Interrupt Enable */
+#define MA35_IER_BUFERR_IEN	BIT(5)  /* Buffer Error Interrupt Enable */
+#define MA35_IER_TIME_OUT_EN	BIT(11) /* RX Buffer Time-out Counter Enable */
+#define MA35_IER_AUTO_RTS	BIT(12) /* nRTS Auto-flow Control Enable */
+#define MA35_IER_AUTO_CTS	BIT(13) /* nCTS Auto-flow Control Enable */
+
+/* MA35_FCR_REG - FIFO Control Register */
+#define MA35_FCR_RFR		BIT(1)  /* RX Field Software Reset */
+#define MA35_FCR_TFR		BIT(2)  /* TX Field Software Reset */
+#define MA35_FCR_RFITL_MASK	GENMASK(7, 4) /* RX FIFO Interrupt Trigger Level */
+#define MA35_FCR_RFITL_1BYTE	FIELD_PREP(MA35_FCR_RFITL_MASK, 0)
+#define MA35_FCR_RFITL_4BYTES	FIELD_PREP(MA35_FCR_RFITL_MASK, 1)
+#define MA35_FCR_RFITL_8BYTES	FIELD_PREP(MA35_FCR_RFITL_MASK, 2)
+#define MA35_FCR_RFITL_14BYTES	FIELD_PREP(MA35_FCR_RFITL_MASK, 3)
+#define MA35_FCR_RFITL_30BYTES	FIELD_PREP(MA35_FCR_RFITL_MASK, 4)
+#define MA35_FCR_RTSTL_MASK	GENMASK(19, 16) /* nRTS Trigger Level */
+#define MA35_FCR_RTSTL_1BYTE	FIELD_PREP(MA35_FCR_RTSTL_MASK, 0)
+#define MA35_FCR_RTSTL_4BYTES	FIELD_PREP(MA35_FCR_RTSTL_MASK, 1)
+#define MA35_FCR_RTSTL_8BYTES	FIELD_PREP(MA35_FCR_RTSTL_MASK, 2)
+#define MA35_FCR_RTSTL_14BYTES	FIELD_PREP(MA35_FCR_RTSTL_MASK, 3)
+#define MA35_FCR_RTSTLL_30BYTES	FIELD_PREP(MA35_FCR_RTSTL_MASK, 4)
+
+/* MA35_LCR_REG - Line Control Register */
+#define	MA35_LCR_NSB		BIT(2)  /* Number of “STOP Bit” */
+#define MA35_LCR_PBE		BIT(3)  /* Parity Bit Enable */
+#define MA35_LCR_EPE		BIT(4)  /* Even Parity Enable */
+#define MA35_LCR_SPE		BIT(5)  /* Stick Parity Enable */
+#define MA35_LCR_BREAK		BIT(6)  /* Break Control */
+#define MA35_LCR_WLS_MASK	GENMASK(1, 0) /* Word Length Selection */
+#define MA35_LCR_WLS_5BITS	FIELD_PREP(MA35_LCR_WLS_MASK, 0)
+#define MA35_LCR_WLS_6BITS	FIELD_PREP(MA35_LCR_WLS_MASK, 1)
+#define MA35_LCR_WLS_7BITS	FIELD_PREP(MA35_LCR_WLS_MASK, 2)
+#define MA35_LCR_WLS_8BITS	FIELD_PREP(MA35_LCR_WLS_MASK, 3)
+
+/* MA35_MCR_REG - Modem Control Register */
+#define MA35_MCR_RTS_CTRL	BIT(1)  /* nRTS Signal Control */
+#define MA35_MCR_RTSACTLV	BIT(9)  /* nRTS Pin Active Level */
+#define MA35_MCR_RTSSTS		BIT(13) /* nRTS Pin Status (Read Only) */
+
+/* MA35_MSR_REG - Modem Status Register */
+#define MA35_MSR_CTSDETF	BIT(0)  /* Detect nCTS State Change Flag */
+#define MA35_MSR_CTSSTS		BIT(4)  /* nCTS Pin Status (Read Only) */
+#define MA35_MSR_CTSACTLV	BIT(8)  /* nCTS Pin Active Level */
+
+/* MA35_FSR_REG - FIFO Status Register */
+#define MA35_FSR_RX_OVER_IF	BIT(0)  /* RX Overflow Error Interrupt Flag */
+#define MA35_FSR_PEF		BIT(4)  /* Parity Error Flag*/
+#define MA35_FSR_FEF		BIT(5)  /* Framing Error Flag */
+#define MA35_FSR_BIF		BIT(6)  /* Break Interrupt Flag */
+#define MA35_FSR_RX_EMPTY	BIT(14) /* Receiver FIFO Empty (Read Only) */
+#define MA35_FSR_RX_FULL	BIT(15) /* Receiver FIFO Full (Read Only) */
+#define MA35_FSR_TX_EMPTY	BIT(22) /* Transmitter FIFO Empty (Read Only) */
+#define MA35_FSR_TX_FULL	BIT(23) /* Transmitter FIFO Full (Read Only) */
+#define MA35_FSR_TX_OVER_IF	BIT(24) /* TX Overflow Error Interrupt Flag */
+#define MA35_FSR_TE_FLAG	BIT(28) /* Transmitter Empty Flag (Read Only) */
+#define MA35_FSR_RXPTR_MSK	GENMASK(13, 8) /* TX FIFO Pointer mask */
+#define MA35_FSR_TXPTR_MSK	GENMASK(21, 16) /* RX FIFO Pointer mask */
+
+/* MA35_ISR_REG - Interrupt Status Register */
+#define MA35_ISR_RDA_IF		BIT(0)  /* RBR Available Interrupt Flag */
+#define MA35_ISR_THRE_IF	BIT(1)  /* THR Empty Interrupt Flag */
+#define MA35_ISR_RLSIF		BIT(2)  /* Receive Line Interrupt Flag */
+#define MA35_ISR_MODEMIF	BIT(3)  /* MODEM Interrupt Flag */
+#define MA35_ISR_RXTO_IF	BIT(4)  /* RX Time-out Interrupt Flag */
+#define MA35_ISR_BUFEIF		BIT(5)  /* Buffer Error Interrupt Flag */
+#define MA35_ISR_WK_IF		BIT(6)  /* UART Wake-up Interrupt Flag */
+#define MA35_ISR_RDAINT		BIT(8)  /* RBR Available Interrupt Indicator */
+#define MA35_ISR_THRE_INT	BIT(9)  /* THR Empty Interrupt Indicator */
+#define MA35_ISR_ALL		0xFFFFFFFF
+
+/* MA35_BAUD_REG - Baud Rate Divider Register */
+#define	MA35_BAUD_MODE_MASK	GENMASK(29, 28)
+#define MA35_BAUD_MODE0		FIELD_PREP(MA35_BAUD_MODE_MASK, 0)
+#define MA35_BAUD_MODE1		FIELD_PREP(MA35_BAUD_MODE_MASK, 2)
+#define MA35_BAUD_MODE2		FIELD_PREP(MA35_BAUD_MODE_MASK, 3)
+#define	MA35_BAUD_MASK		GENMASK(15, 0)
+
+/* MA35_ALTCTL_REG - Alternate Control/Status Register */
+#define MA35_ALTCTL_RS485AUD	BIT(10) /* RS-485 Auto Direction Function */
+
+/* MA35_FUN_SEL_REG - Function Select Register */
+#define MA35_FUN_SEL_MASK	GENMASK(2, 0)
+#define MA35_FUN_SEL_UART	FIELD_PREP(MA35_FUN_SEL_MASK, 0)
+#define MA35_FUN_SEL_RS485	FIELD_PREP(MA35_FUN_SEL_MASK, 3)
+
+/* The constrain for MA35D1 UART baud rate divider */
+#define MA35_BAUD_DIV_MAX	0xFFFF
+#define MA35_BAUD_DIV_MIN	11
+
+/* UART FIFO depth */
+#define MA35_UART_FIFO_DEPTH	32
+/* UART console clock */
+#define MA35_UART_CONSOLE_CLK	(24 * HZ_PER_MHZ)
+/* UART register ioremap size */
+#define MA35_UART_REG_SIZE	0x100
+/* Rx Timeout */
+#define MA35_UART_RX_TOUT	0x40
+
+#define MA35_IER_CONFIG		(MA35_IER_RTO_IEN | MA35_IER_RDA_IEN | \
+				 MA35_IER_TIME_OUT_EN | MA35_IER_BUFERR_IEN)
+
+#define MA35_ISR_IF_CHECK	(MA35_ISR_RDA_IF | MA35_ISR_RXTO_IF | \
+				 MA35_ISR_THRE_INT | MA35_ISR_BUFEIF)
+
+#define MA35_FSR_TX_BOTH_EMPTY	(MA35_FSR_TE_FLAG | MA35_FSR_TX_EMPTY)
+
+static struct uart_driver ma35d1serial_reg;
+
+struct uart_ma35d1_port {
+	struct uart_port port;
+	struct clk *clk;
+	u16 capabilities; /* port capabilities */
+	u8 ier;
+	u8 lcr;
+	u8 mcr;
+	u32 baud_rate;
+	u32 console_baud_rate;
+	u32 console_line;
+	u32 console_int;
+};
+
+static struct uart_ma35d1_port ma35d1serial_ports[MA35_UART_NR];
+
+static struct uart_ma35d1_port *to_ma35d1_uart_port(struct uart_port *uart)
+{
+	return container_of(uart, struct uart_ma35d1_port, port);
+}
+
+static u32 serial_in(struct uart_ma35d1_port *p, u32 offset)
+{
+	return readl_relaxed(p->port.membase + offset);
+}
+
+static void serial_out(struct uart_ma35d1_port *p, u32 offset, u32 value)
+{
+	writel_relaxed(value, p->port.membase + offset);
+}
+
+static void __stop_tx(struct uart_ma35d1_port *p)
+{
+	u32 ier;
+
+	ier = serial_in(p, MA35_IER_REG);
+	if (ier & MA35_IER_THRE_IEN)
+		serial_out(p, MA35_IER_REG, ier & ~MA35_IER_THRE_IEN);
+}
+
+static void ma35d1serial_stop_tx(struct uart_port *port)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+
+	__stop_tx(up);
+}
+
+static void transmit_chars(struct uart_ma35d1_port *up)
+{
+	u32 count;
+	u8 ch;
+
+	if (uart_tx_stopped(&up->port)) {
+		ma35d1serial_stop_tx(&up->port);
+		return;
+	}
+	count = MA35_UART_FIFO_DEPTH - FIELD_GET(MA35_FSR_TXPTR_MSK,
+						 serial_in(up, MA35_FSR_REG));
+	uart_port_tx_limited(&up->port, ch, count,
+			     !(serial_in(up, MA35_FSR_REG) & MA35_FSR_TX_FULL),
+			     serial_out(up, MA35_THR_REG, ch),
+			     ({}));
+}
+
+static void ma35d1serial_start_tx(struct uart_port *port)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	u32 ier;
+
+	ier = serial_in(up, MA35_IER_REG);
+	serial_out(up, MA35_IER_REG, ier & ~MA35_IER_THRE_IEN);
+	transmit_chars(up);
+	serial_out(up, MA35_IER_REG, ier | MA35_IER_THRE_IEN);
+}
+
+static void ma35d1serial_stop_rx(struct uart_port *port)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	u32 ier;
+
+	ier = serial_in(up, MA35_IER_REG);
+	ier &= ~MA35_IER_RDA_IEN;
+	serial_out(up, MA35_IER_REG, ier);
+}
+
+static void receive_chars(struct uart_ma35d1_port *up)
+{
+	int max_count = 256;
+	u8 ch, flag;
+	u32 fsr;
+
+	fsr = serial_in(up, MA35_FSR_REG);
+	do {
+		flag = TTY_NORMAL;
+		up->port.icount.rx++;
+
+		if (unlikely(fsr & (MA35_FSR_BIF | MA35_FSR_FEF |
+				    MA35_FSR_PEF | MA35_FSR_RX_OVER_IF))) {
+			if (fsr & MA35_FSR_BIF) {
+				up->port.icount.brk++;
+				if (uart_handle_break(&up->port))
+					continue;
+			}
+			if (fsr & MA35_FSR_FEF)
+				up->port.icount.frame++;
+			if (fsr & MA35_FSR_PEF)
+				up->port.icount.parity++;
+			if (fsr & MA35_FSR_RX_OVER_IF)
+				up->port.icount.overrun++;
+
+			serial_out(up, MA35_FSR_REG,
+				   fsr & (MA35_FSR_BIF | MA35_FSR_FEF |
+					  MA35_FSR_PEF | MA35_FSR_RX_OVER_IF));
+			if (fsr & MA35_FSR_BIF)
+				flag = TTY_BREAK;
+			else if (fsr & MA35_FSR_PEF)
+				flag = TTY_PARITY;
+			else if (fsr & MA35_FSR_FEF)
+				flag = TTY_FRAME;
+		}
+
+		ch = serial_in(up, MA35_RBR_REG);
+		if (uart_handle_sysrq_char(&up->port, ch))
+			continue;
+
+		spin_lock(&up->port.lock);
+		uart_insert_char(&up->port, fsr, MA35_FSR_RX_OVER_IF, ch, flag);
+		spin_unlock(&up->port.lock);
+
+		fsr = serial_in(up, MA35_FSR_REG);
+	} while (!(fsr & MA35_FSR_RX_EMPTY) && (max_count-- > 0));
+
+	spin_lock(&up->port.lock);
+	tty_flip_buffer_push(&up->port.state->port);
+	spin_unlock(&up->port.lock);
+}
+
+static irqreturn_t ma35d1serial_interrupt(int irq, void *dev_id)
+{
+	struct uart_port *port = dev_id;
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	u32 isr, fsr;
+
+	isr = serial_in(up, MA35_ISR_REG);
+	fsr = serial_in(up, MA35_FSR_REG);
+
+	if (!(isr & MA35_ISR_IF_CHECK))
+		return IRQ_NONE;
+
+	if (isr & (MA35_ISR_RDA_IF | MA35_ISR_RXTO_IF))
+		receive_chars(up);
+	if (isr & MA35_ISR_THRE_INT)
+		transmit_chars(up);
+	if (fsr & MA35_FSR_TX_OVER_IF)
+		serial_out(up, MA35_FSR_REG, MA35_FSR_TX_OVER_IF);
+
+	return IRQ_HANDLED;
+}
+
+static u32 ma35d1serial_tx_empty(struct uart_port *port)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	u32 fsr;
+
+	fsr = serial_in(up, MA35_FSR_REG);
+	if ((fsr & MA35_FSR_TX_BOTH_EMPTY) == MA35_FSR_TX_BOTH_EMPTY)
+		return TIOCSER_TEMT;
+	else
+		return 0;
+}
+
+static u32 ma35d1serial_get_mctrl(struct uart_port *port)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	u32 status;
+	u32 ret = 0;
+
+	status = serial_in(up, MA35_MSR_REG);
+	if (!(status & MA35_MSR_CTSSTS))
+		ret |= TIOCM_CTS;
+	return ret;
+}
+
+static void ma35d1serial_set_mctrl(struct uart_port *port, u32 mctrl)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	u32 mcr, msr, ier;
+
+	mcr = serial_in(up, MA35_MCR_REG);
+	mcr &= ~MA35_MCR_RTS_CTRL;
+
+	if (mctrl & TIOCM_RTS)
+		mcr |= MA35_MCR_RTSACTLV;
+	else
+		mcr &= ~MA35_MCR_RTSACTLV;
+
+	if (up->mcr & UART_MCR_AFE) {
+		ier = serial_in(up, MA35_IER_REG);
+		ier |= MA35_IER_AUTO_RTS | MA35_IER_AUTO_CTS;
+		serial_out(up, MA35_IER_REG, ier);
+		up->port.flags |= UPF_HARD_FLOW;
+	} else {
+		ier = serial_in(up, MA35_IER_REG);
+		ier &= ~(MA35_IER_AUTO_RTS | MA35_IER_AUTO_CTS);
+		serial_out(up, MA35_IER_REG, ier);
+		up->port.flags &= ~UPF_HARD_FLOW;
+	}
+
+	msr = serial_in(up, MA35_MSR_REG);
+	msr |= MA35_MSR_CTSACTLV;
+	serial_out(up, MA35_MSR_REG, msr);
+	serial_out(up, MA35_MCR_REG, mcr);
+}
+
+static void ma35d1serial_break_ctl(struct uart_port *port, int break_state)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	unsigned long flags;
+	u32 lcr;
+
+	spin_lock_irqsave(&up->port.lock, flags);
+	lcr = serial_in(up, MA35_LCR_REG);
+	if (break_state != 0)
+		lcr |= MA35_LCR_BREAK;
+	else
+		lcr &= ~MA35_LCR_BREAK;
+	serial_out(up, MA35_LCR_REG, lcr);
+	spin_unlock_irqrestore(&up->port.lock, flags);
+}
+
+static int ma35d1serial_startup(struct uart_port *port)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	u32 fcr;
+	int retval;
+
+	/* Reset FIFO */
+	serial_out(up, MA35_FCR_REG, MA35_FCR_TFR | MA35_FCR_RFR);
+
+	/* Clear pending interrupts */
+	serial_out(up, MA35_ISR_REG, MA35_ISR_ALL);
+
+	retval = request_irq(port->irq, ma35d1serial_interrupt, 0,
+			     dev_name(port->dev), port);
+	if (retval) {
+		dev_err(up->port.dev, "request irq failed.\n");
+		return retval;
+	}
+
+	fcr = serial_in(up, MA35_FCR_REG);
+	fcr |= MA35_FCR_RFITL_4BYTES | MA35_FCR_RTSTL_8BYTES;
+	serial_out(up, MA35_FCR_REG, fcr);
+	serial_out(up, MA35_LCR_REG, MA35_LCR_WLS_8BITS);
+	serial_out(up, MA35_TOR_REG, MA35_UART_RX_TOUT);
+	serial_out(up, MA35_IER_REG, MA35_IER_CONFIG);
+	return 0;
+}
+
+static void ma35d1serial_shutdown(struct uart_port *port)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+
+	serial_out(up, MA35_IER_REG, 0);
+	free_irq(port->irq, port);
+}
+
+static void ma35d1serial_set_termios(struct uart_port *port,
+				     struct ktermios *termios,
+				     const struct ktermios *old)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+	unsigned long flags;
+	u32 baud, quot;
+	u32 lcr = 0;
+
+	lcr = UART_LCR_WLEN(tty_get_char_size(termios->c_cflag));
+
+	if (termios->c_cflag & CSTOPB)
+		lcr |= MA35_LCR_NSB;
+	if (termios->c_cflag & PARENB)
+		lcr |= MA35_LCR_PBE;
+	if (!(termios->c_cflag & PARODD))
+		lcr |= MA35_LCR_EPE;
+	if (termios->c_cflag & CMSPAR)
+		lcr |= MA35_LCR_SPE;
+
+	baud = uart_get_baud_rate(port, termios, old,
+				  port->uartclk / MA35_BAUD_DIV_MAX,
+				  port->uartclk / MA35_BAUD_DIV_MIN);
+
+	/* MA35D1 UART baud rate equation: baudrate = UART_CLK / (quot + 2) */
+	quot = (port->uartclk / baud) - 2;
+
+	/*
+	 * Ok, we're now changing the port state.  Do it with
+	 * interrupts disabled.
+	 */
+	spin_lock_irqsave(&up->port.lock, flags);
+
+	up->port.read_status_mask = MA35_FSR_RX_OVER_IF;
+	if (termios->c_iflag & INPCK)
+		up->port.read_status_mask |= MA35_FSR_FEF | MA35_FSR_PEF;
+	if (termios->c_iflag & (BRKINT | PARMRK))
+		up->port.read_status_mask |= MA35_FSR_BIF;
+
+	/* Characteres to ignore */
+	up->port.ignore_status_mask = 0;
+	if (termios->c_iflag & IGNPAR)
+		up->port.ignore_status_mask |= MA35_FSR_FEF | MA35_FSR_PEF;
+	if (termios->c_iflag & IGNBRK) {
+		up->port.ignore_status_mask |= MA35_FSR_BIF;
+		/*
+		 * If we're ignoring parity and break indicators,
+		 * ignore overruns too (for real raw support).
+		 */
+		if (termios->c_iflag & IGNPAR)
+			up->port.ignore_status_mask |= MA35_FSR_RX_OVER_IF;
+	}
+	if (termios->c_cflag & CRTSCTS)
+		up->mcr |= UART_MCR_AFE;
+	else
+		up->mcr &= ~UART_MCR_AFE;
+
+	uart_update_timeout(port, termios->c_cflag, baud);
+
+	ma35d1serial_set_mctrl(&up->port, up->port.mctrl);
+
+	serial_out(up, MA35_BAUD_REG, MA35_BAUD_MODE2 | FIELD_PREP(MA35_BAUD_MASK, quot));
+
+	serial_out(up, MA35_LCR_REG, lcr);
+
+	spin_unlock_irqrestore(&up->port.lock, flags);
+}
+
+static const char *ma35d1serial_type(struct uart_port *port)
+{
+	return "ma35d1-uart";
+}
+
+static void ma35d1serial_config_port(struct uart_port *port, int flags)
+{
+	/*
+	 * Driver core for serial ports forces a non-zero value for port type.
+	 * Write an arbitrary value here to accommodate the serial core driver,
+	 * as ID part of UAPI is redundant.
+	 */
+	port->type = 1;
+}
+
+static int ma35d1serial_verify_port(struct uart_port *port, struct serial_struct *ser)
+{
+	if (port->type != PORT_UNKNOWN && ser->type != 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct uart_ops ma35d1serial_ops = {
+	.tx_empty     = ma35d1serial_tx_empty,
+	.set_mctrl    = ma35d1serial_set_mctrl,
+	.get_mctrl    = ma35d1serial_get_mctrl,
+	.stop_tx      = ma35d1serial_stop_tx,
+	.start_tx     = ma35d1serial_start_tx,
+	.stop_rx      = ma35d1serial_stop_rx,
+	.break_ctl    = ma35d1serial_break_ctl,
+	.startup      = ma35d1serial_startup,
+	.shutdown     = ma35d1serial_shutdown,
+	.set_termios  = ma35d1serial_set_termios,
+	.type         = ma35d1serial_type,
+	.config_port  = ma35d1serial_config_port,
+	.verify_port  = ma35d1serial_verify_port,
+};
+
+static const struct of_device_id ma35d1_serial_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-uart" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ma35d1_serial_of_match);
+
+#ifdef CONFIG_SERIAL_NUVOTON_MA35D1_CONSOLE
+
+static struct device_node *ma35d1serial_uart_nodes[MA35_UART_NR];
+
+static void wait_for_xmitr(struct uart_ma35d1_port *up)
+{
+	unsigned int reg = 0;
+
+	read_poll_timeout_atomic(serial_in, reg, reg & MA35_FSR_TX_EMPTY,
+				 1, 10000, false,
+				 up, MA35_FSR_REG);
+}
+
+static void ma35d1serial_console_putchar(struct uart_port *port, unsigned char ch)
+{
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+
+	wait_for_xmitr(up);
+	serial_out(up, MA35_THR_REG, ch);
+}
+
+/*
+ *  Print a string to the serial port trying not to disturb
+ *  any possible real use of the port...
+ *
+ *  The console_lock must be held when we get here.
+ */
+static void ma35d1serial_console_write(struct console *co, const char *s, u32 count)
+{
+	struct uart_ma35d1_port *up = &ma35d1serial_ports[co->index];
+	unsigned long flags;
+	int locked = 1;
+	u32 ier;
+
+	if (up->port.sysrq)
+		locked = 0;
+	else if (oops_in_progress)
+		locked = spin_trylock_irqsave(&up->port.lock, flags);
+	else
+		spin_lock_irqsave(&up->port.lock, flags);
+
+	/*
+	 *  First save the IER then disable the interrupts
+	 */
+	ier = serial_in(up, MA35_IER_REG);
+	serial_out(up, MA35_IER_REG, 0);
+
+	uart_console_write(&up->port, s, count, ma35d1serial_console_putchar);
+
+	wait_for_xmitr(up);
+	serial_out(up, MA35_IER_REG, ier);
+
+	if (locked)
+		spin_unlock_irqrestore(&up->port.lock, flags);
+}
+
+static int __init ma35d1serial_console_setup(struct console *co, char *options)
+{
+	struct device_node *np;
+	struct uart_ma35d1_port *p;
+	u32 val32[4];
+	struct uart_port *port;
+	int baud = 115200;
+	int bits = 8;
+	int parity = 'n';
+	int flow = 'n';
+
+	if ((co->index < 0) || (co->index >= MA35_UART_NR)) {
+		pr_debug("Console Port%x out of range\n", co->index);
+		return -EINVAL;
+	}
+
+	np = ma35d1serial_uart_nodes[co->index];
+	p = &ma35d1serial_ports[co->index];
+	if (!np || !p)
+		return -ENODEV;
+
+	if (of_property_read_u32_array(np, "reg", val32, ARRAY_SIZE(val32)) != 0)
+		return -EINVAL;
+
+	p->port.iobase = val32[1];
+	p->port.membase = ioremap(p->port.iobase, MA35_UART_REG_SIZE);
+	if (!p->port.membase)
+		return -ENOMEM;
+
+	p->port.ops = &ma35d1serial_ops;
+	p->port.line = 0;
+	p->port.uartclk = MA35_UART_CONSOLE_CLK;
+
+	port = &ma35d1serial_ports[co->index].port;
+
+	if (options)
+		uart_parse_options(options, &baud, &parity, &bits, &flow);
+
+	return uart_set_options(port, co, baud, parity, bits, flow);
+}
+
+static struct console ma35d1serial_console = {
+	.name    = "ttyNVT",
+	.write   = ma35d1serial_console_write,
+	.device  = uart_console_device,
+	.setup   = ma35d1serial_console_setup,
+	.flags   = CON_PRINTBUFFER | CON_ENABLED,
+	.index   = -1,
+	.data    = &ma35d1serial_reg,
+};
+
+static void ma35d1serial_console_init_port(void)
+{
+	u32 i = 0;
+	struct device_node *np;
+
+	for_each_matching_node(np, ma35d1_serial_of_match) {
+		if (ma35d1serial_uart_nodes[i] == NULL) {
+			of_node_get(np);
+			ma35d1serial_uart_nodes[i] = np;
+			i++;
+			if (i == MA35_UART_NR)
+				break;
+		}
+	}
+}
+
+static int __init ma35d1serial_console_init(void)
+{
+	ma35d1serial_console_init_port();
+	register_console(&ma35d1serial_console);
+	return 0;
+}
+console_initcall(ma35d1serial_console_init);
+
+#define MA35D1SERIAL_CONSOLE    (&ma35d1serial_console)
+#else
+#define MA35D1SERIAL_CONSOLE    NULL
+#endif
+
+static struct uart_driver ma35d1serial_reg = {
+	.owner        = THIS_MODULE,
+	.driver_name  = "serial",
+	.dev_name     = "ttyNVT",
+	.major        = TTY_MAJOR,
+	.minor        = 64,
+	.cons         = MA35D1SERIAL_CONSOLE,
+	.nr           = MA35_UART_NR,
+};
+
+/*
+ * Register a set of serial devices attached to a platform device.
+ * The list is terminated with a zero flags entry, which means we expect
+ * all entries to have at least UPF_BOOT_AUTOCONF set.
+ */
+static int ma35d1serial_probe(struct platform_device *pdev)
+{
+	struct resource *res_mem;
+	struct uart_ma35d1_port *up;
+	int ret = 0;
+
+	if (pdev->dev.of_node) {
+		ret = of_alias_get_id(pdev->dev.of_node, "serial");
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to get alias/pdev id, errno %d\n", ret);
+			return ret;
+		}
+	}
+	up = &ma35d1serial_ports[ret];
+	up->port.line = ret;
+	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res_mem)
+		return -ENODEV;
+
+	up->port.iobase = res_mem->start;
+	up->port.membase = ioremap(up->port.iobase, MA35_UART_REG_SIZE);
+	up->port.ops = &ma35d1serial_ops;
+
+	spin_lock_init(&up->port.lock);
+
+	up->clk = of_clk_get(pdev->dev.of_node, 0);
+	if (IS_ERR(up->clk)) {
+		ret = PTR_ERR(up->clk);
+		dev_err(&pdev->dev, "failed to get core clk: %d\n", ret);
+		goto err_iounmap;
+	}
+
+	ret = clk_prepare_enable(up->clk);
+	if (ret)
+		goto err_iounmap;
+
+	if (up->port.line != 0)
+		up->port.uartclk = clk_get_rate(up->clk);
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto err_clk_disable;
+
+	up->port.irq = ret;
+	up->port.dev = &pdev->dev;
+	up->port.flags = UPF_BOOT_AUTOCONF;
+
+	platform_set_drvdata(pdev, up);
+
+	ret = uart_add_one_port(&ma35d1serial_reg, &up->port);
+	if (ret < 0)
+		goto err_free_irq;
+
+	return 0;
+
+err_free_irq:
+	free_irq(up->port.irq, &up->port);
+
+err_clk_disable:
+	clk_disable_unprepare(up->clk);
+
+err_iounmap:
+	iounmap(up->port.membase);
+	return ret;
+}
+
+/*
+ * Remove serial ports registered against a platform device.
+ */
+static int ma35d1serial_remove(struct platform_device *dev)
+{
+	struct uart_port *port = platform_get_drvdata(dev);
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+
+	uart_remove_one_port(&ma35d1serial_reg, port);
+	clk_disable_unprepare(up->clk);
+	return 0;
+}
+
+static int ma35d1serial_suspend(struct platform_device *dev, pm_message_t state)
+{
+	struct uart_port *port = platform_get_drvdata(dev);
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+
+	uart_suspend_port(&ma35d1serial_reg, &up->port);
+	if (up->port.line == 0) {
+		up->console_baud_rate = serial_in(up, MA35_BAUD_REG);
+		up->console_line = serial_in(up, MA35_LCR_REG);
+		up->console_int = serial_in(up, MA35_IER_REG);
+	}
+	return 0;
+}
+
+static int ma35d1serial_resume(struct platform_device *dev)
+{
+	struct uart_port *port = platform_get_drvdata(dev);
+	struct uart_ma35d1_port *up = to_ma35d1_uart_port(port);
+
+	if (up->port.line == 0) {
+		serial_out(up, MA35_BAUD_REG, up->console_baud_rate);
+		serial_out(up, MA35_LCR_REG, up->console_line);
+		serial_out(up, MA35_IER_REG, up->console_int);
+	}
+	uart_resume_port(&ma35d1serial_reg, &up->port);
+	return 0;
+}
+
+static struct platform_driver ma35d1serial_driver = {
+	.probe      = ma35d1serial_probe,
+	.remove     = ma35d1serial_remove,
+	.suspend    = ma35d1serial_suspend,
+	.resume     = ma35d1serial_resume,
+	.driver     = {
+		.name   = "ma35d1-uart",
+		.owner  = THIS_MODULE,
+		.of_match_table = of_match_ptr(ma35d1_serial_of_match),
+	},
+};
+
+static int __init ma35d1serial_init(void)
+{
+	int ret;
+
+	ret = uart_register_driver(&ma35d1serial_reg);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&ma35d1serial_driver);
+	if (ret)
+		uart_unregister_driver(&ma35d1serial_reg);
+
+	return ret;
+}
+
+static void __exit ma35d1serial_exit(void)
+{
+	platform_driver_unregister(&ma35d1serial_driver);
+	uart_unregister_driver(&ma35d1serial_reg);
+}
+
+module_init(ma35d1serial_init);
+module_exit(ma35d1serial_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MA35D1 serial driver");
-- 
2.34.1

