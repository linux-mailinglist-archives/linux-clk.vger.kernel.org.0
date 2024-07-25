Return-Path: <linux-clk+bounces-9988-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45FD93C19B
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2024 14:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 586CFB2283D
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2024 12:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B56D19AA53;
	Thu, 25 Jul 2024 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zWw0zP02"
X-Original-To: linux-clk@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597B199E88;
	Thu, 25 Jul 2024 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721909807; cv=none; b=cZH6eUCXpARyXLhnX6HQcld5d8NU7U+3zY29tJ8vVZHXZbskyc3uQdjo6by289Y+l6JR5EMHLY9oX5Q3vRQLT/1Su3SO3YJtqg9aMr794AhaHOUMSGGL0fEFuB/gVD+UEMmFHHtc3Wxkl+3PTeA9AJ74ry5OUpOKrvs7BZ48p4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721909807; c=relaxed/simple;
	bh=13pBX7HrqyQLqJez8Tn1NpNnpK0lqqwZHVuFDqzCnWU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XaNOdcHRKWVvnbvNsKU6/aFkXy+bhaXEniCb5JtIMzU/Yd065U8gKoxQs7xFVJpPAGBocK18QsJChUM9QaBlR3wtA3oLvP1QZTd2/MoOI9/mEY3ibhCkhilTttGBwZRhMDI0gIRg0VSesVRRzcLPXce+x1Oaye2wPvH1CwyYUmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=zWw0zP02; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909806; x=1753445806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=13pBX7HrqyQLqJez8Tn1NpNnpK0lqqwZHVuFDqzCnWU=;
  b=zWw0zP02Lc20jbJNCMV/WlX6E1X78LPCUNLIEnFcIEKUeu4ctT96PN42
   75ErYH/S4xQ5x6bHL1FoHdB2j8TLXyRMlfI3oZrT0mtU0nX57SqFz6V5x
   oCPBSkkAwyyWkWyuNI6HIeerFo2wYcVV7cUzFPxDcCPyG6wIEIeDVCaRs
   xghy1hF9mrwj3QiG7zIuwuMyzvtAOysraPmTSRDBaK+et7F7hJ6NTO+D2
   EzQk25sMSrj5qS1wfGr2m3NjXVNg0ILAcVWPu/MKFQWxO4qSaL807paZb
   iwad8AXRZSzcId6Ve8u0aQImtGz/6xKZn++U9K7GCGDXZ3oDmCfbVD9Kt
   w==;
X-CSE-ConnectionGUID: 7H0adE5mRmid6ymnvkB3VA==
X-CSE-MsgGUID: D6u//OryTremXiN8sf3jMw==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="197092681"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:37 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:35 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/17] dt-bindings: clock: mpfs-clkcfg: Add PIC64GX compatibility
Date: Thu, 25 Jul 2024 13:16:00 +0100
Message-ID: <20240725121609.13101-9-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX has a clock controller compatible whith mpfs-clkcfg

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index e4e1c31267d2..ca889f5df87a 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-clkcfg
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-clkcfg
+          - const: microchip,mpfs-clkcfg
+      - const: microchip,mpfs-clkcfg
 
   reg:
     items:
-- 
2.30.2


