Return-Path: <linux-clk+bounces-32984-lists+linux-clk=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-clk@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBmuOfuob2kZEwAAu9opvQ
	(envelope-from <linux-clk+bounces-32984-lists+linux-clk=lfdr.de@vger.kernel.org>)
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 17:10:35 +0100
X-Original-To: lists+linux-clk@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 814404721F
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 17:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8D098721A8D
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 14:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FCC43E4B9;
	Tue, 20 Jan 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="gCp7kAsk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D843CEC1;
	Tue, 20 Jan 2026 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920464; cv=none; b=q+OGMw+p4S6hKtxxoSb0VITXPSa5MdVhx6R8g6G+EOqYPziEvi0SZ5nwj4t8v9CpintEJ9iFSznkuv7Sw9SgqHL19B5Eaw2OIuJX3ZtMmSAHMFPsQyAfoxAcXCfk4RIPY2/eMVi0GsDY6M+Ov+mFhTKW5rekEpveciqquj3Y79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920464; c=relaxed/simple;
	bh=S+YzY3yWLHJBzPQ+BP8F0P/REajJo7wlTKOXADK+CNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HzjR/vSP7c5eFirFRcj1/JmUvFUDN6Fk+elcBCNAkUDCbCIN1VG+fch0ey0c53K9SYfdg8LLemgan9D9sTbKCxHK7aDfle5gdHOH0zN6EzvdyXSTZWLJv1TSWbNAKVkMWkSIcFfXu1UlgF/xfBepnd/DOdxfa6UscCDz9JP3cjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=gCp7kAsk; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD18B148AD3E;
	Tue, 20 Jan 2026 15:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919905; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3hoXMVRSQSHzlrc6BbneIFGzDKJfR415NtQHWKx5Mxg=;
	b=gCp7kAske59StqI62JOTq91WMYEzRi/kuFO6Kgah5eMF6sbw8oWBk7eY2Xgw+L/xV6KKoS
	L8mESPh9n3EW0iIeJzDepuQzirbqipPiVsY7dI4w6cmWiCnTveSNapWDAhJNaoJXEqJjJT
	HbTbcmc9XAn73oHmwbgxmXbpqDjHntg5ZwlOWnrj4wIc+dblxxNh4Orwnr0zCn6xyLB7hs
	dpWpKyFtNbdpOmZ2XugdmRig8X2melFBk0fEyNp9BpmYMpd5+F1gy4ffsCwi/IzTaRpZeO
	jXtNx4hr2MrEbAlvzQqf009jtjLxmvi4VTPkOvClSCECQtPWLkNRDaVvZOF19Q==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 01/19] MAINTAINERS: Add sam9/sama to (AT91) SoC support
Date: Tue, 20 Jan 2026 15:37:22 +0100
Message-ID: <20260120143759.904013-2-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[thorsis.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-32984-lists,linux-clk=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[thorsis.com,quarantine];
	DKIM_TRACE(0.00)[thorsis.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-clk];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FROM_NEQ_ENVFROM(0.00)[ada@thorsis.com,linux-clk@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 814404721F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Will catch previously unmatched files in include/dt-bindings/*

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - new patch, not present in v2

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index da9dbc1a40194..c882399c5e4b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3033,6 +3033,7 @@ F:	include/soc/at91/
 X:	drivers/input/touchscreen/atmel_mxt_ts.c
 N:	at91
 N:	atmel
+N:	sam[9a]
 
 ARM/Microchip Sparx5 SoC support
 M:	Steen Hegelund <Steen.Hegelund@microchip.com>
-- 
2.47.3


