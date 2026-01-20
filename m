Return-Path: <linux-clk+bounces-33014-lists+linux-clk=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-clk@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNLfKHPDb2lsMQAAu9opvQ
	(envelope-from <linux-clk+bounces-33014-lists+linux-clk=lfdr.de@vger.kernel.org>)
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 19:03:31 +0100
X-Original-To: lists+linux-clk@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F22D49069
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 19:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 007A74441FB
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 17:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0B343E4B9;
	Tue, 20 Jan 2026 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="OMxkNh93"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655543DA3C;
	Tue, 20 Jan 2026 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931322; cv=none; b=TPqE+oc7X6DVDHvYJQUMcRSbsU7o6Dk3IB6hO6+Wzi8+Kx1zoWF2UfY+2g+23nHmmQckZhn8z/jsqh4tSa9SPjeK/19slMxFCuvNW1mXFRWjiB4YhclZmKx0PXEjh0YdUWOlMQRpu6pYL15xM1U9Hlh1MoUF37xj0VroSNL4Vhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931322; c=relaxed/simple;
	bh=7kW22UW+7xA5y0ucn5PnI7BCOSzMzalLAWmU10+QQEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qv98YFT51dXjGnq94VTllIqfUr/fg/Gl+2NOoBBE13E5Lmeus6lihGxXVhsPfNylWMrL6dMiOnCFt1DGy1sk/bURtju0rZnVFzDIjzaQazRGexDGN2PEUDlZwBWtyHps4d+hCaQJvqvhSlQd7TAsEOEriYduUl9cDXSDKjlJ8Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=OMxkNh93; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FAA8148ABD0;
	Tue, 20 Jan 2026 18:48:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768931318; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5vMBKkvm6k3gmJ6Qe3oDHVl+mCgwYJYz+Jp8UVTdokc=;
	b=OMxkNh93XArjOYe9qyeEqLB1bx7/aoP5yvVdUFj4WJItIGLh/iMqDc+7hSO7hSrG+RVHjz
	FR9umWLBBaoFdVfdNQSPOGAwpLG2WQCWG8/lH2bchzPaPjFQFw/uh0m6isWrcgyjjYfqHg
	EUOEuda/On8b/M+xPinElT99QFYWVU3hMWZABgJdkieRA1IxSKcf/oN7AmZIbuI+OxqTIb
	BWKgMecizUu/1aIQrqEs0prt2bRN/qngcdzDVY2kQwgJrxUyvy/i15tgoVNWtmX/X5yy5Y
	pG8C8lJ4hAJnwDldUoQFm776NaQ05bn/TpwlTOZJcl+ixV2wAClISLhWNUlxAA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 17/19] ARM: dts: microchip: sam9x60: Add OTPC node
Date: Tue, 20 Jan 2026 16:44:51 +0100
Message-ID: <20260120154502.1280938-11-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[thorsis.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33014-lists,linux-clk=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ada@thorsis.com,linux-clk@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[thorsis.com,quarantine];
	DKIM_TRACE(0.00)[thorsis.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-clk,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_PROHIBIT(0.00)[5.93.74.128:email];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,eff00000:email,thorsis.com:email,thorsis.com:dkim,thorsis.com:mid]
X-Rspamd-Queue-Id: 3F22D49069
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
interface between the system and the OTP memory.  It also features the
Unique Product ID (UID) registers containing a unique serial number.

See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
Controller (OTPC)" for reference.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Removed needless header include
    - Removed clock-names, not part of bindings anymore, and not used by driver
    
    v2:
    - squashed with patch adding the clock properties

 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index f9e3962faca3f..098996739a62f 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -157,6 +157,14 @@ sdmmc1: sdio-host@90000000 {
 			status = "disabled";
 		};
 
+		otpc: efuse@eff00000 {
+			compatible = "microchip,sam9x60-otpc", "syscon";
+			reg = <0xeff00000 0xec>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
+		};
+
 		apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
-- 
2.47.3


