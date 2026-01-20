Return-Path: <linux-clk+bounces-32996-lists+linux-clk=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-clk@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOFMGmuyb2nMKgAAu9opvQ
	(envelope-from <linux-clk+bounces-32996-lists+linux-clk=lfdr.de@vger.kernel.org>)
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 17:50:51 +0100
X-Original-To: lists+linux-clk@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DAC47F5D
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 17:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 336D7805714
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 16:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3C1441046;
	Tue, 20 Jan 2026 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="GeGBCJCN"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C53C2F3C03;
	Tue, 20 Jan 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923911; cv=none; b=azHuKz5fLyYrh5M9uwtetcjwKZvZJD+bp8kMXZyyBvbj1+25aTXAfxk9TsZ1n8lQGJKh5n8DSXHVK/nVEBlyr9HkU1MH9zWjpD9+Rt3Qjj1eiSHe69wx8XvOxn11Dy83yIA79I09e76DamfcmWEUowVywXsCXLlgkonwdFzIIic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923911; c=relaxed/simple;
	bh=+Q2I2mWd2Vajv5LxeUM4eqagGG5F5YWyLVUrHEcDYGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiVfRjxE71FofOdqi/fnztdq9q7RJD82E/y0OIG+lIlZh52rzEwEGVBiVwweMfda7/VjHnvkFRnvbsnD6OAoDx/u5dSQZXf6tu6F+0f/S9JV4KFcqRpndfA+yC7YJUU8rpDL1uy9i7NdKHxr5G0iCQ7AdnIeqFBlshQ/bPMhTew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=GeGBCJCN; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0A0F148AD3B;
	Tue, 20 Jan 2026 16:45:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768923907; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BJiMd/bvt8Mwi0Gb2O2U04dAbu/4XAgEuxYlKkUS/zg=;
	b=GeGBCJCNeA38ZnReG8PKPscvRJKfw0WoQ5SoNVwcQyx3rSWA66Plz8oX3ux0PBnWJHHULV
	kc1arm6/QDw69IgLwN2GzqCFeFBGZfnPeijWhc+vNKUrzHI1PszjUMQFAxZm+R0BIGg2Aa
	tYLlnZVPlPEMIE+P31gjBNJCnvgd/mGi3NEOEv57WKyXJjESjnn4J4aCDCVUdbTeaoAecY
	3dz8yuEnnnyzg9nq+PhkVHzKkvtO2m92dIWYoBJ/iFDR9180ewS4pB9Q3cpCpDSqhdKX3v
	MSBhagsffZf36pWmP+NKMtctz+JAQqqrsS7gaYhG7nRPAMI6KoJMX4UCZ96TAQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 08/19] dt-bindings: nvmem: microchip-otpc: Add compatible for SAM9X60
Date: Tue, 20 Jan 2026 16:44:42 +0100
Message-ID: <20260120154502.1280938-2-ada@thorsis.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[thorsis.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32996-lists,linux-clk=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,linaro.org:email,thorsis.com:email,thorsis.com:dkim,thorsis.com:mid]
X-Rspamd-Queue-Id: 02DAC47F5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SAM9X60 SoC family has a similar, but slightly different OTPC to the
SAMA7G5 family.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    v3:
    - Added Acked-by trailer
    
    v2:
    - Fix dt_binding_check warnings

 .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682e..9a7aaf64eef32 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -21,7 +21,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: microchip,sama7g5-otpc
+      - enum:
+          - microchip,sam9x60-otpc
+          - microchip,sama7g5-otpc
       - const: syscon
 
   reg:
-- 
2.47.3


