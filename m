Return-Path: <linux-clk+bounces-14415-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EC49C19D4
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3828B2421B
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CABF1E2849;
	Fri,  8 Nov 2024 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZPhnPxJ5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B281E25F9
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060331; cv=none; b=tnI52NpKExwd8ja6Gti2yB4MCfalouRMXId/Lx9oeN8Pw6Q7vDzCsTB3CZzemx9OT7Rs1r8tv+t4PXt6aeDt1V89Msosyc7zGFYuO7LfOgn/2shnN8YoVz5iazzap29yXOZ1o+FZTPkDXcoypm+Oy2cJxczMIFMv3lobVY+2pC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060331; c=relaxed/simple;
	bh=BgOPSQ7c0J4d6ewxUtdYFmLo2T0PX3nx4z8vFiy0Dzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UIyHA0eRYSrpBboXRiWCXINq2iReFydauUHvfShdC7eg3zPdu6qvnLkGqz8ufvJsnc4m9z+F7CtNEjdYILelPX8xeSqDHbfwoD9YL6LsTj/wDE3GFAUkJYi7vOG4iJXqoE2TDm2LtooLvyTYY1yTCISMhdtjFpyVpkQHlddvDcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZPhnPxJ5; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so2847979a12.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731060328; x=1731665128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUv28lbMsyBChqctRtrz1p3A2PKo+pEzM5ucEbUVEb8=;
        b=ZPhnPxJ5wORAjRtCXyX08P/0Dr/AeDdyRw0e6/UYsCcyuIBkot8PrIoIqy8972+Wm8
         msZAu3Wtmcn8fDA2DXEy/oHIw9FT+BMt/9N5Vd2l5ZFmE/BSXi+oA2P97tOxf5d7Uz3v
         ++TIql+A80iLP7krOXN/dfGlUAw3FdhBqRmy3e856B84dA+xjgSRfqLP23jcaXxD5S7+
         h9gIf6SI0PkP6krr/rLvfR7sry/TB25H7pznZXPEAUcCMS1VUyNvGNbmUgtl84xjM320
         CHPGfygtY+ZL9kSsOb3ixMJdfzlD51MwpqkYq2j96l4y4F1S+/NkFFsgliS6QtdeFPGT
         XMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060328; x=1731665128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUv28lbMsyBChqctRtrz1p3A2PKo+pEzM5ucEbUVEb8=;
        b=VR7s4gUc6q7/sMCqhGnGX5NEOcxzoAS5cZAUjIpUWsjDN3N8d2kgooK+7/u/Xrm9uT
         50vtmi85Ommfrg+EORb2LcLOycYNS1h/SOwjLl4m238TvAxpY9aCZ97nW8Eae3+56rZX
         ImKOiweJbFLzd4GWfkOdT0mOa/MjzHY5ZKNQ6Gt9EX7f3CL2QGaL/yTzkZc/h41lg9lY
         F5vPEN1X4imWV2EoFt/TzchW2m3NdUWofjwhGRBSPSDk1PJvqWyHs/bW4u/YCPFIm8fk
         jYfccrRP4+QrSYu5Sax3K16SV51cvBttGCfMsXmj2dflsQV+jUC+dBhvGm1KW5Px7I7r
         pNng==
X-Forwarded-Encrypted: i=1; AJvYcCXdiHaxFkuZefHwShAONZ7YEwR4gPsOJ4pRm+wvUdclBZg08pSrB5jm1tiytWW4AJRij+c1JDrdWbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32H10ngG+vENlUITfPXxe+plpa6VFUoMBWqlmISGI9ZyS8ky0
	3wP7Ccjq7obCTNhr+52b2gqzapT0NloGCsYDKxPCWoWuhk78uu2Xbkdbslpbouw=
X-Google-Smtp-Source: AGHT+IF+h9p5JumX4emsZBdvGGEPis1TD0I5veqSjZLmqOsxOYeukhqk+3FKjeU7y12hCI0Mg88X5w==
X-Received: by 2002:a05:6402:35cd:b0:5cb:7594:9ece with SMTP id 4fb4d7f45d1cf-5cf0a3261a4mr1638069a12.17.1731060327733;
        Fri, 08 Nov 2024 02:05:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4f0bdsm1775959a12.56.2024.11.08.02.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:05:27 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	g.liakhovetski@gmx.de,
	lethal@linux-sh.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/8] serial: sh-sci: Check if TX data was written to device in .tx_empty()
Date: Fri,  8 Nov 2024 12:05:07 +0200
Message-Id: <20241108100513.2814957-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S, when doing suspend to RAM, the uart_suspend_port()
is called. The uart_suspend_port() calls 3 times the
struct uart_port::ops::tx_empty() before shutting down the port.

According to the documentation, the struct uart_port::ops::tx_empty()
API tests whether the transmitter FIFO and shifter for the port is
empty.

The Renesas RZ/G3S SCIFA IP reports the number of data units stored in the
transmit FIFO through the FDR (FIFO Data Count Register). The data units
in the FIFOs are written in the shift register and transmitted from there.
The TEND bit in the Serial Status Register reports if the data was
transmitted from the shift register.

In the previous code, in the tx_empty() API implemented by the sh-sci
driver, it is considered that the TX is empty if the hardware reports the
TEND bit set and the number of data units in the FIFO is zero.

According to the HW manual, the TEND bit has the following meaning:

0: Transmission is in the waiting state or in progress.
1: Transmission is completed.

It has been noticed that when opening the serial device w/o using it and
then switch to a power saving mode, the tx_empty() call in the
uart_port_suspend() function fails, leading to the "Unable to drain
transmitter" message being printed on the console. This is because the
TEND=0 if nothing has been transmitted and the FIFOs are empty. As the
TEND=0 has double meaning (waiting state, in progress) we can't
determined the scenario described above.

Add a software workaround for this. This sets a variable if any data has
been sent on the serial console (when using PIO) or if the DMA callback has
been called (meaning something has been transmitted).

Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- use bool type instead of atomic_t

 drivers/tty/serial/sh-sci.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 136e0c257af1..65514d37bfe2 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -157,6 +157,7 @@ struct sci_port {
 
 	bool has_rtscts;
 	bool autorts;
+	bool first_time_tx;
 };
 
 #define SCI_NPORTS CONFIG_SERIAL_SH_SCI_NR_UARTS
@@ -850,6 +851,7 @@ static void sci_transmit_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
 	unsigned int stopped = uart_tx_stopped(port);
+	struct sci_port *s = to_sci_port(port);
 	unsigned short status;
 	unsigned short ctrl;
 	int count;
@@ -885,6 +887,7 @@ static void sci_transmit_chars(struct uart_port *port)
 		}
 
 		sci_serial_out(port, SCxTDR, c);
+		s->first_time_tx = true;
 
 		port->icount.tx++;
 	} while (--count > 0);
@@ -1241,6 +1244,8 @@ static void sci_dma_tx_complete(void *arg)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 
+	s->first_time_tx = true;
+
 	if (!kfifo_is_empty(&tport->xmit_fifo)) {
 		s->cookie_tx = 0;
 		schedule_work(&s->work_tx);
@@ -2076,6 +2081,10 @@ static unsigned int sci_tx_empty(struct uart_port *port)
 {
 	unsigned short status = sci_serial_in(port, SCxSR);
 	unsigned short in_tx_fifo = sci_txfill(port);
+	struct sci_port *s = to_sci_port(port);
+
+	if (!s->first_time_tx)
+		return TIOCSER_TEMT;
 
 	return (status & SCxSR_TEND(port)) && !in_tx_fifo ? TIOCSER_TEMT : 0;
 }
@@ -2247,6 +2256,7 @@ static int sci_startup(struct uart_port *port)
 
 	dev_dbg(port->dev, "%s(%d)\n", __func__, port->line);
 
+	s->first_time_tx = false;
 	sci_request_dma(port);
 
 	ret = sci_request_irq(s);
@@ -2267,6 +2277,7 @@ static void sci_shutdown(struct uart_port *port)
 	dev_dbg(port->dev, "%s(%d)\n", __func__, port->line);
 
 	s->autorts = false;
+	s->first_time_tx = false;
 	mctrl_gpio_disable_ms(to_sci_port(port)->gpios);
 
 	uart_port_lock_irqsave(port, &flags);
-- 
2.39.2


