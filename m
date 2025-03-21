Return-Path: <linux-clk+bounces-19672-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0180A6BE2D
	for <lists+linux-clk@lfdr.de>; Fri, 21 Mar 2025 16:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3999A3B68FA
	for <lists+linux-clk@lfdr.de>; Fri, 21 Mar 2025 15:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825F022AE59;
	Fri, 21 Mar 2025 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cTPzNcMu"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852A2224B0B
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570323; cv=none; b=Z+Xb3rw+bxRaeOBivG7XHsOt+V7+EQcnphxW66xQSYIPyMJIO1EDBGWgX/WbOeVFZjHoVdmRK5Fz7a0MoWooXe4ul0Vij8ehvkjNQTTDhTIjFxsvb6irA6aczjcoSAz9Xn+i0GmcvPhwK4WC1AvLl7KAXp4+VHg3RguwYemWLYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570323; c=relaxed/simple;
	bh=EiLGbixER1ZnWIy7PM3VTt8I+j4UUPk9+5W+XfhjL/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rg7jIKTVqDi7qkAhpd7nLaFSaojTSv/0yOKs4zvQlC9pT5i15wGi58oVLqI/dGjZpfApj+8/zdn9dBh2TvpV+Ggoly3Q2WibsK0ubtExj9XKX6kNyfPrs7Z9OVce84kwJyVmc7FNxCY5T7kRTXgzj1uPt5xy3R0tO9TxISGK40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cTPzNcMu; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85e1b1f08a5so56990139f.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570320; x=1743175120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DaRxF5HZnJi0Y3x/zgrpOyNbzKQMeKO2j9zKPPajyk=;
        b=cTPzNcMuRGz48DUVc1fhm991qnQaGszpxMjRTatjq2bZlceGgeJt2Bsem0c3VixnY3
         pvTZbEk1nq3LyfW6cwU0RQ9o1z4Q4QL3ghnJ2d25XQGMeRWKuNideLsQedm/BhlQ7jpN
         r6JGgcvWW73ziRvjoWX35IDEGwzQiABYbcO7GTCdAe8OeShw7NiBfCJEVB8XxSWUzsIv
         e5e//cQQvyvH4NBBTKrEu+XYnk/Nl6wWinXJ2HW1QheRtHig5va0/Kw2b7GFmF1N+frD
         QiApmdkQ7xzJ7pbV+XFqrkK1QNI3KggdnBLmc2ad3mq7eorqePg5uOmqqSGhzoZZfzMB
         s4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570320; x=1743175120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DaRxF5HZnJi0Y3x/zgrpOyNbzKQMeKO2j9zKPPajyk=;
        b=n7DOnwx4yjMZcM+bGvqSZHv3LWHQX1NIgFEMoa6b12VxDNNPKtuWBFfKRgJIsRkPa9
         CuNumgsj6UFWgjQrTPb8YMRdSWW20P9Wn9H+QU7/esvKbuStPmlBASq3NDMnUSiHMZ5+
         LfEC0sf8RXJT3wXmclQ+RjcRpPsxThq4I4eqVNRvo4a6gBpbnsC/9AsIkrLI0bphMSBv
         SIh5XXWs9yU1yO1yeJ1wA+OIYFx4wBSSK0SYruOl3KvZSdJTTgfveWke+HQMwpb594or
         ZEAkZwzxFhIyyyJy+WTLwTb/xbdsNbelQ9gvJnOGmWI5290i3pKOWaZykprS3hxIve7R
         eJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7M6RJd5JIKer8ZqcES6z8m4y8IQyhuOBOEh6vOjt3I+RGPmzncjum3HHBDJG4smBkslFxEQTIAhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSHOAM68kfqh5vuobyeNGJr4qj7a2qLEVH4o/h5uBAxIvUbWZ
	m5P1bayWPivdGsndBShOI5xvbNHps1MIp4G1hF2WeT9zy+Fs5k6icgIgRzf3AHI=
X-Gm-Gg: ASbGnctOkL8D0XITsDLaeDYCUgTktRXiDkW26knl+UAmmxYk2JQVdxm35skAqDAMJDz
	UGrQ+O9G5bFumHtHW506avtY0Hq4+iK3rJJ5CkD4cSHhexIo9D+1Y12eA1rB/tM5SbVP/RZzLbz
	9DiEfjFqBm+ZY8bZwNarr8EpR7eWxratiwlEud95CHds3xMGO69iuHF+AXbNEOzNWx77zlYm/bf
	0zoxeFLzMXZ6VSfW6V5Ok38cTe5v3EAEpivFelByrVz3+OTehnV7MxS50cMwz9eTsgFs5+ZJ+4y
	48LtgF8jRb/RhvUaQO6WVCLo+ZKptoMb6hyW8yyzo7e5OO3bOPWWfXuC9gb3VDAlT4rVyFyHFTo
	Bzr1mYknkxUtdS1trrfNteSP8
X-Google-Smtp-Source: AGHT+IEDO81CrFPGhN/YwBNeRCRgIrzUHDwyQgr0jaqHGFIo0KKqQ6pgYrHMrCLox7vU1hB2EoJFfQ==
X-Received: by 2002:a92:cd8b:0:b0:3d1:78f1:8a9e with SMTP id e9e14a558f8ab-3d59618550dmr38183365ab.20.1742570320394;
        Fri, 21 Mar 2025 08:18:40 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:40 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 4/7] clk: spacemit: define existing syscon resets
Date: Fri, 21 Mar 2025 10:18:27 -0500
Message-ID: <20250321151831.623575-5-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define reset controls associated with the MPMU, APBC, and APMU
SpacemiT K1 CCUs.  These already have clocks associated with them.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 132 ++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 6d879411c6c05..be8abd27753cb 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -151,6 +151,13 @@ struct k1_ccu_data {
 	const struct ccu_reset_controller_data *rst_data;
 };
 
+#define RST_DATA(_offset, _assert_mask, _deassert_mask)	\
+	{						\
+		.offset		= (_offset),		\
+		.assert_mask	= (_assert_mask),	\
+		.deassert_mask	= (_deassert_mask),	\
+	}
+
 struct ccu_reset_controller {
 	struct regmap *regmap;
 	const struct ccu_reset_controller_data *data;
@@ -1428,6 +1435,7 @@ static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
 
 static const struct k1_ccu_data k1_ccu_apbs_data = {
 	.clk		= k1_ccu_apbs_clks,
+	/* No resets in the APBS CCU */
 };
 
 static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
@@ -1467,8 +1475,18 @@ static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data mpmu_reset_data[] = {
+	[RST_WDT]	= RST_DATA(MPMU_WDTPCR,			BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data mpmu_reset_controller_data = {
+	.count		= ARRAY_SIZE(mpmu_reset_data),
+	.data		= mpmu_reset_data,
+};
+
 static const struct k1_ccu_data k1_ccu_mpmu_data = {
 	.clk		= k1_ccu_mpmu_clks,
+	.rst_data	= &mpmu_reset_controller_data,
 };
 
 static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
@@ -1575,8 +1593,68 @@ static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data apbc_reset_data[] = {
+	[RST_UART0]	= RST_DATA(APBC_UART1_CLK_RST,		BIT(2),	0),
+	[RST_UART2]	= RST_DATA(APBC_UART2_CLK_RST,		BIT(2), 0),
+	[RST_GPIO]	= RST_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
+	[RST_PWM0]	= RST_DATA(APBC_PWM0_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM1]	= RST_DATA(APBC_PWM1_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM2]	= RST_DATA(APBC_PWM2_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM3]	= RST_DATA(APBC_PWM3_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM4]	= RST_DATA(APBC_PWM4_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM5]	= RST_DATA(APBC_PWM5_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM6]	= RST_DATA(APBC_PWM6_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM7]	= RST_DATA(APBC_PWM7_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM8]	= RST_DATA(APBC_PWM8_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM9]	= RST_DATA(APBC_PWM9_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM10]	= RST_DATA(APBC_PWM10_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM11]	= RST_DATA(APBC_PWM11_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM12]	= RST_DATA(APBC_PWM12_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM13]	= RST_DATA(APBC_PWM13_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM14]	= RST_DATA(APBC_PWM14_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM15]	= RST_DATA(APBC_PWM15_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM16]	= RST_DATA(APBC_PWM16_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM17]	= RST_DATA(APBC_PWM17_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM18]	= RST_DATA(APBC_PWM18_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM19]	= RST_DATA(APBC_PWM19_CLK_RST,		BIT(2), BIT(0)),
+	[RST_SSP3]	= RST_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
+	[RST_UART3]	= RST_DATA(APBC_UART3_CLK_RST,		BIT(2), 0),
+	[RST_RTC]	= RST_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
+	[RST_TWSI0]	= RST_DATA(APBC_TWSI0_CLK_RST,		BIT(2), 0),
+	[RST_TIMERS1]	= RST_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
+	[RST_AIB]	= RST_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
+	[RST_TIMERS2]	= RST_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
+	[RST_ONEWIRE]	= RST_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
+	[RST_SSPA0]	= RST_DATA(APBC_SSPA0_CLK_RST,		BIT(2), 0),
+	[RST_SSPA1]	= RST_DATA(APBC_SSPA1_CLK_RST,		BIT(2), 0),
+	[RST_DRO]	= RST_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
+	[RST_IR]	= RST_DATA(APBC_IR_CLK_RST,		BIT(2), 0),
+	[RST_TWSI1]	= RST_DATA(APBC_TWSI1_CLK_RST,		BIT(2), 0),
+	[RST_TSEN]	= RST_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
+	[RST_TWSI2]	= RST_DATA(APBC_TWSI2_CLK_RST,		BIT(2), 0),
+	[RST_TWSI4]	= RST_DATA(APBC_TWSI4_CLK_RST,		BIT(2), 0),
+	[RST_TWSI5]	= RST_DATA(APBC_TWSI5_CLK_RST,		BIT(2), 0),
+	[RST_TWSI6]	= RST_DATA(APBC_TWSI6_CLK_RST,		BIT(2), 0),
+	[RST_TWSI7]	= RST_DATA(APBC_TWSI7_CLK_RST,		BIT(2), 0),
+	[RST_TWSI8]	= RST_DATA(APBC_TWSI8_CLK_RST,		BIT(2), 0),
+	[RST_IPC_AP2AUD] = RST_DATA(APBC_IPC_AP2AUD_CLK_RST,	BIT(2), 0),
+	[RST_UART4]	= RST_DATA(APBC_UART4_CLK_RST,		BIT(2), 0),
+	[RST_UART5]	= RST_DATA(APBC_UART5_CLK_RST,		BIT(2), 0),
+	[RST_UART6]	= RST_DATA(APBC_UART6_CLK_RST,		BIT(2), 0),
+	[RST_UART7]	= RST_DATA(APBC_UART7_CLK_RST,		BIT(2), 0),
+	[RST_UART8]	= RST_DATA(APBC_UART8_CLK_RST,		BIT(2), 0),
+	[RST_UART9]	= RST_DATA(APBC_UART9_CLK_RST,		BIT(2), 0),
+	[RST_CAN0]	= RST_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data apbc_reset_controller_data = {
+	.count		= ARRAY_SIZE(apbc_reset_data),
+	.data		= apbc_reset_data,
+};
+
 static const struct k1_ccu_data k1_ccu_apbc_data = {
 	.clk		= k1_ccu_apbc_clks,
+	.rst_data	= &apbc_reset_controller_data,
 };
 
 static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
@@ -1645,8 +1723,62 @@ static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data apmu_reset_data[] = {
+	[RST_CCIC_4X]	= RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_CCIC1_PHY] = RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
+	[RST_SDH_AXI]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_SDH0]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_SDH1]	= RST_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_SDH2]	= RST_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_USBP1_AXI] = RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
+	[RST_USB_AXI]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_USB3_0]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				      BIT(9)|BIT(10)|BIT(11)),
+	[RST_QSPI]	= RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_QSPI_BUS] = RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_DMA]	= RST_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_AES]	= RST_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
+	[RST_VPU]	= RST_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_GPU]	= RST_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_EMMC]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_EMMC_X]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_AUDIO]	= RST_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
+				   BIT(0) | BIT(2) | BIT(3)),
+	[RST_HDMI]	= RST_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
+	[RST_PCIE0]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
+				   BIT(3) | BIT(4) | BIT(5)),
+	[RST_PCIE1]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
+				   BIT(3) | BIT(4) | BIT(5)),
+	[RST_PCIE2]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
+				   BIT(3) | BIT(4) | BIT(5)),
+	[RST_EMAC0]	= RST_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_EMAC1]	= RST_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_JPG]	= RST_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_CCIC2PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(2)),
+	[RST_CCIC3PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(29)),
+	[RST_CSI]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_ISP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_ISP_CPP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
+	[RST_ISP_BUS]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
+	[RST_ISP_CI]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
+	[RST_DPU_MCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
+	[RST_DPU_ESC]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
+	[RST_DPU_HCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
+	[RST_DPU_SPIBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL,	0, BIT(4)),
+	[RST_DPU_SPI_HBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
+	[RST_V2D]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
+	[RST_MIPI]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
+	[RST_MC]	= RST_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data apmu_reset_controller_data = {
+	.count		= ARRAY_SIZE(apmu_reset_data),
+	.data		= apmu_reset_data,
+};
+
 static const struct k1_ccu_data k1_ccu_apmu_data = {
 	.clk		= k1_ccu_apmu_clks,
+	.rst_data	= &apmu_reset_controller_data,
 };
 
 static struct ccu_reset_controller *
-- 
2.43.0


