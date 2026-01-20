Return-Path: <linux-clk+bounces-32985-lists+linux-clk=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-clk@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OacK6esb2ncEwAAu9opvQ
	(envelope-from <linux-clk+bounces-32985-lists+linux-clk=lfdr.de@vger.kernel.org>)
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 17:26:15 +0100
X-Original-To: lists+linux-clk@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B84775D
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 17:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6CDB8723BEC
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 14:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9910F43E9C6;
	Tue, 20 Jan 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="cIcorOan"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E4F43E4B0;
	Tue, 20 Jan 2026 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920464; cv=none; b=Lp4O5TWBIz642qwCRWCrAhlqtBxpwXWn5AKH0a6AclNIQsbf2s/dwki0G2GeLMQSuTGB3kPCwbSZO+g0L5YiFJI7AS1TkRI1qtxVEUPrueI0aoxYYtrELqe6WcjaraYIhltp3KRzvheZNSMnALAX1RBbrdfia5IuaIgCzL/nxTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920464; c=relaxed/simple;
	bh=V6hE6IPDG45uQXmdNT3RqGEYPKYStaOfLFEtkJxcYLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhRmtKCG9UI8jK0ZTeb6Hm2vcUlrNU2YWpmXK24V6oObKBXnW75kphty08GuC9igGlRg9lZwzC00lHKZsv54TsH03+KTWONwqjjOVL9vuX45n91HzjG6RFgAGEJ1YltsMZnrTAQXsL5QZM9WTxskFcVZoYFS9oL2vpKrh8+8XJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=cIcorOan; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55ADE148AC11;
	Tue, 20 Jan 2026 15:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919908; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0Q4KxaumXr/I3N+USRelHC+Ec4RhrRY/NcEDOdheJqc=;
	b=cIcorOanxwDfHb3hqHFECCmwACYAldSxVcBFu81t1B70g9kRsdc5DFI+V7eiZtni7wcmRX
	f51f7+4NSQmnqw+NekBOVclt+wlXSBz23j1ehV5yQ/jSgWpazYPQ71RBOjEnThu+sZNayX
	aNSdxUCrC8we9JNa7TsrPMIsQhOVKs7ehL1dVnJOTEgNQoYN75WXNC4x1FxE/1v/PcezmY
	kS1w5NG9WlCM5hGXQq8uaQEv/WrwhuC+1P/3GeiHamtl+sFYBElVULA7LGv7xwg/+w3MwZ
	/DvzoD/SvRUWSa8Naz+lKCZH9I/bp0qN4rcSJyR4Ec4/gdPUtJygejZ/GqZUZA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 03/19] dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
Date: Tue, 20 Jan 2026 15:37:24 +0100
Message-ID: <20260120143759.904013-4-ada@thorsis.com>
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
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[thorsis.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32985-lists,linux-clk=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[thorsis.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ada@thorsis.com,linux-clk@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[thorsis.com,quarantine];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-clk,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,thorsis.com:email,thorsis.com:dkim,thorsis.com:mid]
X-Rspamd-Queue-Id: 5C3B84775D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The main rc oscillator will be needed for the OTPC to work properly.

The new index introduced here was not used on the four affected SoC
clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - adapt to different base changes, added lines are the same
    
    v2:
    - new patch, not present in v1

 include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
 include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
 include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
 include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
index 91f8f863ea076..1f6bb51780d09 100644
--- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -10,6 +10,7 @@
 #define SAM9X60_PMC_MCK		1
 #define SAM9X60_PMC_UTMI	2
 #define SAM9X60_PMC_MAIN	3
+#define SAM9X60_PMC_MAIN_RC	6
 #define SAM9X60_PMC_PLLACK	7
 
 #endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
index e1dd41fe75046..657f32ce10071 100644
--- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -10,6 +10,7 @@
 #define SAM9X7_PMC_MCK		1
 #define SAM9X7_PMC_UTMI		2
 #define SAM9X7_PMC_MAIN		3
+#define SAM9X7_PMC_MAIN_RC	6
 #define SAM9X7_PMC_PLLACK	7
 #define SAM9X7_PMC_AUDIOPMCPLL	9
 #define SAM9X7_PMC_AUDIOIOPLL	10
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
index 09d152da6db44..ddcb236718978 100644
--- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -12,6 +12,7 @@
 #define SAMA7D65_PMC_MAIN		3
 #define SAMA7D65_PMC_CPUPLL		4
 #define SAMA7D65_PMC_SYSPLL		5
+#define SAMA7D65_PMC_MAIN_RC		6
 #define SAMA7D65_PMC_BAUDPLL		8
 #define SAMA7D65_PMC_AUDIOPMCPLL	9
 #define SAMA7D65_PMC_AUDIOIOPLL		10
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
index 0303cae56f849..e891715a35173 100644
--- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -12,6 +12,7 @@
 #define SAMA7G5_PMC_MAIN	3
 #define SAMA7G5_PMC_CPUPLL	4
 #define SAMA7G5_PMC_SYSPLL	5
+#define SAMA7G5_PMC_MAIN_RC	6
 #define SAMA7G5_PMC_AUDIOPMCPLL	9
 #define SAMA7G5_PMC_AUDIOIOPLL	10
 #define SAMA7G5_PMC_MCK1	13
-- 
2.47.3


