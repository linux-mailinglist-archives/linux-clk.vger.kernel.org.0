Return-Path: <linux-clk+bounces-2115-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1545E8257F6
	for <lists+linux-clk@lfdr.de>; Fri,  5 Jan 2024 17:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D8EFB21DF9
	for <lists+linux-clk@lfdr.de>; Fri,  5 Jan 2024 16:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A19531725;
	Fri,  5 Jan 2024 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="YgBZW8H8"
X-Original-To: linux-clk@vger.kernel.org
Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01A2E824;
	Fri,  5 Jan 2024 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 8AC1B100866;
	Fri,  5 Jan 2024 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1704471664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbTPIz1gjiBa6bP04mmh2p5yqroBe9n9SqY/1TA2rR0=;
	b=YgBZW8H8tPQZI6XRVvoImj6SKnHvJEXOz+8OiJKrlS5cGHYR5FwJdv8eX6O/0iXgn3b/7j
	4iJaXnf+9nOUnjAZqYiMB2UA042Qd29XFU4/6TX3nBNAIjedZIuvicOChnGm/T1LJD5m1y
	KFBufk7ulRwHQNfFXv3/xdJOjaKDQq4=
Received: from frank-G5.. (fttx-pool-80.245.77.34.bambit.de [80.245.77.34])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B4938360670;
	Fri,  5 Jan 2024 16:21:03 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: reset: mediatek: add MT7988 LVTS reset ID
Date: Fri,  5 Jan 2024 17:20:54 +0100
Message-Id: <20240105162056.43266-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105162056.43266-1-linux@fw-web.de>
References: <20240105162056.43266-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 675202b4-de89-47e3-acdb-612b0c41f0f9

From: Frank Wunderlich <frank-w@public-files.de>

Add reset constant for using as index in driver and dts.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
 - add missing commit message and SoB
 - change value of infrareset to 0
---
 include/dt-bindings/reset/mediatek,mt7988-resets.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
index 493301971367..0216eeb249c7 100644
--- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
+++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
@@ -10,4 +10,8 @@
 /* ETHWARP resets */
 #define MT7988_ETHWARP_RST_SWITCH		0
 
+/* INFRA resets */
+#define MT7988_INFRA_RST0_THERM_CTRL_SWRST	0
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT7988 */
+
-- 
2.34.1


