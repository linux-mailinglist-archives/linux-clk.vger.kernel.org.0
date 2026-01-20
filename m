Return-Path: <linux-clk+bounces-33016-lists+linux-clk=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-clk@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEhAAWfPb2mgMQAAu9opvQ
	(envelope-from <linux-clk+bounces-33016-lists+linux-clk=lfdr.de@vger.kernel.org>)
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 19:54:31 +0100
X-Original-To: lists+linux-clk@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24C49DAF
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 19:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 16BF888187E
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 17:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DEB44A72D;
	Tue, 20 Jan 2026 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="fNeDGe8m"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C22222D1;
	Tue, 20 Jan 2026 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931324; cv=none; b=HNQv67RkpqxYbuC0TAxt9uxqwBnm07MwHpDP5sqhFA3CkAOFhzEwsy65nDWXIoMDoVecIlD1lz7x3CL/nZ9hDHS5R8zQE7flLaWq3yFvPzhgRZHd/F6yaYwVDFHg84g2fd5KAgD4O8CIzf+QBYnTDFivwo+Fqgo+SPsi7U2MYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931324; c=relaxed/simple;
	bh=7LL3M4/ffFk/vEeEKW3RCEzG5kttOyLYdkUAYHMBdRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEKZCuVy1RE2obKSL1X5ki9hRqCJzVe1Nqp9glduKziEi4Cwjev5YFGn0CB0QifmOidYvAsSJmpB48Ylnd8DUkcbiD8jonbdpCOWHFkktxgsywXeHEVqtS9aj6zlI7KmxJoH9EkCU9KUZHRCGfCL7AXglzZddk4LVXsUkNmURt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=fNeDGe8m; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4F55148AD87;
	Tue, 20 Jan 2026 18:48:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768931318; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9iLuhBBaWFw/vFGauqBf+tR/cYKN7IjXcWrjMcj1kg=;
	b=fNeDGe8mv6Rlfr8cFOjBCpX+6Qmj8jO2iHS0qT5DPCfu4kLq0d6MoX4LWa/qi7nti2x986
	l86EFkt6kwe9acw/UA0VDcYTZsAmnUy6AcOAxbKwC5x0FHU5eAMA0P36+DdjYJEn+B8QJv
	da9NlyO2unJsV0tgojRgayTkcmCf//0dLZq5VmZ3GIgFGoEX+opu745SyoyOA81DrHr68p
	vaZqnWRhiiKfCMsGAbq+0BzxZ8Uiix5UmKp6mVcCWoP4ZgDgjpYdOlRG4zqoTfQdPEGaaK
	UWxnIk4AYFJXctNntwVvB5Pde7e37dKAylQjq907GDl0GlIGnoOlVTaYyNMjTg==
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
Subject: [PATCH v3 18/19] ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
Date: Tue, 20 Jan 2026 16:44:52 +0100
Message-ID: <20260120154502.1280938-12-ada@thorsis.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33016-lists,linux-clk=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ada@thorsis.com,linux-clk@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[thorsis.com,quarantine];
	DKIM_TRACE(0.00)[thorsis.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-clk,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,thorsis.com:email,thorsis.com:dkim,thorsis.com:mid]
X-Rspamd-Queue-Id: AF24C49DAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allows to access the OTP memory and Product UID now.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Reworded commit message after reordering patches
    
    v2:
    - same as in v1, no changes

 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
index b9ffd9e5faacc..c110a8e87568a 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
@@ -252,6 +252,10 @@ ethernet-phy@0 {
 	};
 };
 
+&otpc {
+	status = "okay";
+};
+
 &pinctrl {
 	adc {
 		pinctrl_adc_default: adc-default {
-- 
2.47.3


