Return-Path: <linux-clk+bounces-5742-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C351E8A0649
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 04:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EFF7286954
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 02:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBF613B591;
	Thu, 11 Apr 2024 02:58:31 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D98713B2A9;
	Thu, 11 Apr 2024 02:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804311; cv=none; b=HA2RdRDVqs1Fp1cG6DPjWMZNZJZaF0jCZPAi0iXK5qCdQ5eudmLYck1YrkyS8IK5nBcm59ovEnrkq77F6Qv5Z6QPwJTLVI53eVrksKjRzfiPM8vmct3MpTGp39JHG8eZ5GEN7/QTGSAtu3b0abxilBKHImIcQ32yoRjYq33bLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804311; c=relaxed/simple;
	bh=KKPt3mnOeRFdM2h6wYgvIr/lSpNLERM7nn5k6LwUZnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHN0EZYQOt314QWhVBbHrBH1Zb/pp/eNUWTFVB9PGUfdXmzl1KDyeH66vpft897IEvmfCtnD+I7fvn6Ms54lsQ8fI/Hpv05T7dm37aEjHCi2cbPR+Q4MlYoxfk4FeukytiUcjhsenNoajPkf+LWG3jcFffkdBtWd7svol7l567M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8DxdbnSURdm0JwlAA--.5105S3;
	Thu, 11 Apr 2024 10:58:26 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLBPLURdmz8l3AA--.34105S3;
	Thu, 11 Apr 2024 10:58:24 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/6] dt-bindings: clock: Add Loongson-2K expand clock index
Date: Thu, 11 Apr 2024 10:58:06 +0800
Message-ID: <76844e0e4dae290425f7c8025f7f36810cb3a3a8.1712731524.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLBPLURdmz8l3AA--.34105S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFyxXw15KF1rtr13Ww1DXFc_yoW5GrWkpr
	4kuFW2gry7tF4xKw40qr15Kr43ur47Jw1UAF47ur4UXF17A3W8JwnruF4fJryUXF95GFyx
	Aa1Duw40va9rXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU

In the new Loongson-2K family of SoCs, more clock indexes are needed,
such as clock gates.
The patch adds these clock indexes

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/loongson,ls2k-clk.h | 54 ++++++++++++-------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-bindings/clock/loongson,ls2k-clk.h
index 3bc4dfc193c2..4279ba595f1e 100644
--- a/include/dt-bindings/clock/loongson,ls2k-clk.h
+++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
@@ -7,24 +7,40 @@
 #ifndef __DT_BINDINGS_CLOCK_LOONGSON2_H
 #define __DT_BINDINGS_CLOCK_LOONGSON2_H
 
-#define LOONGSON2_REF_100M				0
-#define LOONGSON2_NODE_PLL				1
-#define LOONGSON2_DDR_PLL				2
-#define LOONGSON2_DC_PLL				3
-#define LOONGSON2_PIX0_PLL				4
-#define LOONGSON2_PIX1_PLL				5
-#define LOONGSON2_NODE_CLK				6
-#define LOONGSON2_HDA_CLK				7
-#define LOONGSON2_GPU_CLK				8
-#define LOONGSON2_DDR_CLK				9
-#define LOONGSON2_GMAC_CLK				10
-#define LOONGSON2_DC_CLK				11
-#define LOONGSON2_APB_CLK				12
-#define LOONGSON2_USB_CLK				13
-#define LOONGSON2_SATA_CLK				14
-#define LOONGSON2_PIX0_CLK				15
-#define LOONGSON2_PIX1_CLK				16
-#define LOONGSON2_BOOT_CLK				17
-#define LOONGSON2_CLK_END				18
+#define LOONGSON2_REF_100M	0
+#define LOONGSON2_NODE_PLL	1
+#define LOONGSON2_DDR_PLL	2
+#define LOONGSON2_DC_PLL	3
+#define LOONGSON2_PIX0_PLL	4
+#define LOONGSON2_PIX1_PLL	5
+#define LOONGSON2_NODE_CLK	6
+#define LOONGSON2_HDA_CLK	7
+#define LOONGSON2_GPU_CLK	8
+#define LOONGSON2_DDR_CLK	9
+#define LOONGSON2_GMAC_CLK	10
+#define LOONGSON2_DC_CLK	11
+#define LOONGSON2_APB_CLK	12
+#define LOONGSON2_USB_CLK	13
+#define LOONGSON2_SATA_CLK	14
+#define LOONGSON2_PIX0_CLK	15
+#define LOONGSON2_PIX1_CLK	16
+#define LOONGSON2_BOOT_CLK	17
+#define LOONGSON2_OUT0_GATE	18
+#define LOONGSON2_GMAC_GATE	19
+#define LOONGSON2_RIO_GATE	20
+#define LOONGSON2_DC_GATE	21
+#define LOONGSON2_GPU_GATE	22
+#define LOONGSON2_DDR_GATE	23
+#define LOONGSON2_HDA_GATE	24
+#define LOONGSON2_NODE_GATE	25
+#define LOONGSON2_EMMC_GATE	26
+#define LOONGSON2_PIX0_GATE	27
+#define LOONGSON2_PIX1_GATE	28
+#define LOONGSON2_OUT0_CLK	29
+#define LOONGSON2_RIO_CLK	30
+#define LOONGSON2_EMMC_CLK	31
+#define LOONGSON2_DES_CLK	32
+#define LOONGSON2_I2S_CLK	33
+#define LOONGSON2_MISC_CLK	34
 
 #endif
-- 
2.43.0


