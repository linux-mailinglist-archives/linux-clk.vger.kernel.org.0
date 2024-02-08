Return-Path: <linux-clk+bounces-3441-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9B684E0E4
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 13:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60269B26F28
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 12:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0255762EE;
	Thu,  8 Feb 2024 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BeT9h9ir"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8017762DB
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 12:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396228; cv=none; b=k09F/D+CP79WwuLTwWjI/trUFHvF7wHctepq80i2qoLs0V017bOCsAK26fskps+w59YItha3uZEeNCjWXFrokLGz4iMFmZuSlh4bYbYTtoFHyxObpRYzSDSbyeQshHbYcCIUX73/hKq5m2PL7/1Mh0c/2peO0l6jWdL/ItsP0co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396228; c=relaxed/simple;
	bh=wvZFF9XWrHCOHyRwAnHXOQxcuR1G15MeLFc6eRUwqK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i91l5NU82IhCjHk/SxYBAPHiPyc7zH2AlViCrFvzuY+Ipd92nN8xUKYumFpdUjrXRheLwtegQe6NSCQg9cOQ44A1PmvgBppFiXwhosrEV0Z0cHqz1UaUjg3bE64TxZcyO7jL3XypXH2f7QF5NRoGJXHH1kVnB0Qrx8ms2nB2bOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BeT9h9ir; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41008ab427fso16152425e9.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 04:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396225; x=1708001025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ow+faT4hgMer8zeJzCqLwdgg/8xRAzkk8KZPmhSWKQ=;
        b=BeT9h9irDH3+Qy0KwqKBiaetJDQzSoMKzSP6U7exsIZziEn1TCGvg7CNslcezaHCUx
         WVPgqAyJMrFFWBHDjo7ejeWcGrNQtqUcGyEd4wxQg8rhEd/21RzDqxtWU78WK0ThpNVy
         eKrYQ5tVaXvNzsAdgvWW5AKQU8K1Tl8MVoyRTyRLNmSMbiT5WHp770rq7bIwNlmCyJnm
         eS2LeoH+6i2rGDRi9hpCIx201/HJ+9kx2RLOodwjykO1h8inXpOUWycL6Rsy9fmGFjVS
         TMccah0ys5GQfShbChK3LJ5MeN92R08QPkGd8G09rGtAZ7YTdaZJFgnjQ5+/EosgrogQ
         dOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396225; x=1708001025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ow+faT4hgMer8zeJzCqLwdgg/8xRAzkk8KZPmhSWKQ=;
        b=HV087Lxf2+7F8Dyni+q3+cb0yaV1zZv6cEj4+u9Xc9ROI0HXT7PnREmAgyFWMOs46K
         SGQJxSKPtYxpfhKHttz+WIvtaOgAdpFBCs+Ul84tuFiegcYCBypgtu82YoYUiWNF9aSg
         u1mP8I5yLrb95DVT8UdUTn+dlupQEGwNjCdsVVXw5GdBJ/yBzUlkGOtTO37e946RiL8m
         fpggQZS/T4nmAYdVTHGAhk1uuax4As1g/JdE4uGkGlHAYGh4RfoSsP9Fy73DYrSoDgUW
         QEB7KAHARxSuNHhQkDcmGOoQXaRM/hHIixkavXkhhzsm0Gr4hyxRtHwVhJSngFAtK0j+
         jgAA==
X-Forwarded-Encrypted: i=1; AJvYcCXFdiGX6CDDGKlIXE1ytbA9nH/SeE3Icy491i8lTn7uSHOkJjeC2CKJDMCAOuZ3UOCIDpXyrc3/cT8MI0aKx6heHhT9yB9dfXPE
X-Gm-Message-State: AOJu0Yz7BRn4APi8tpqkuPJGXnW62G/MnTu4hErxzZ5fq6jqwQtS+iFn
	FnJr3zerIVz9kGeoeib70bEPQnYkZ44xttNL9wmww4VxMiqz1TZuVSOwITDtSvEkemHrCGQqGIn
	D
X-Google-Smtp-Source: AGHT+IHyicTpunbhbhnX+rjeXPskzEszKwXMf0SPmU/yTPpq6ZhIJGuE68xbAcSXHbFjDoluo3Zw9Q==
X-Received: by 2002:a05:600c:3541:b0:40f:e284:d785 with SMTP id i1-20020a05600c354100b0040fe284d785mr6290809wmq.23.1707396224891;
        Thu, 08 Feb 2024 04:43:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVVGi/xnS3MAkwMqoIWQk8nAnvu+37WZW5Rvi60gWHp7p7RVZzIJ4HNQRvIwcBvCRJkmrEZ1VUPOz/UMIEx4HzJ5O5RxsaZ2di9pMwILrqqGRU5rnfoXselU+h6zphoB1TEdFCRxx4uxKhEjeqoAi07NcnfH8Y2/IYIdFkmHsWeWIU6GjenGanoI0bnGwkIaNy51dpyf4UKnvQy8NRE2PWPmlhcCXQc7DpC56DCwBPpZVxLjXkJu0AoPWVkAIlGSsbCpS93Wkm3/6y9foLKe8ki7pxY820sJ7vtLaDyfhTKR7DQT7nCxPiAFVqgcmjE79ik68P5VkYX3LTdDw1GyDLnFdaSYbyCESSJta48Hvzl5A17nvO5/BChMTMM/u4tOBb3kTFl4MjniicR0/Dzi0nR7mJ+wu5t21NkE5q3A2ZDuvcRZE8BdqkAbsGiSn79Mhckj17wVFiXE8NGD+U/3jivnI5ksRuQynVniZjj1AhJyC+Kq/fBhaJNgot19KuomeJa3oLIeg47tVxo64+3bbIH005or6j9Cv27ZyFGwqQiiuCvmL9tyYNPPwhTPEHp64=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
Date: Thu,  8 Feb 2024 14:42:44 +0200
Message-Id: <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G2UL (R9A07G043) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a07g043-cpg.h | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
index 77cde8effdc7..eabfeec7ac37 100644
--- a/include/dt-bindings/clock/r9a07g043-cpg.h
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -200,5 +200,53 @@
 #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
 #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
 
+/* Power domain IDs. */
+#define R9A07G043_PD_ALWAYS_ON		0
+#define R9A07G043_PD_GIC		1
+#define R9A07G043_PD_IA55		2
+#define R9A07G043_PD_MHU		3
+#define R9A07G043_PD_CORESIGHT		4
+#define R9A07G043_PD_SYC		5
+#define R9A07G043_PD_DMAC		6
+#define R9A07G043_PD_GTM0		7
+#define R9A07G043_PD_GTM1		8
+#define R9A07G043_PD_GTM2		9
+#define R9A07G043_PD_MTU		10
+#define R9A07G043_PD_POE3		11
+#define R9A07G043_PD_WDT0		12
+#define R9A07G043_PD_SPI		13
+#define R9A07G043_PD_SDHI0		14
+#define R9A07G043_PD_SDHI1		15
+#define R9A07G043_PD_ISU		16
+#define R9A07G043_PD_CRU		17
+#define R9A07G043_PD_LCDC		18
+#define R9A07G043_PD_SSI0		19
+#define R9A07G043_PD_SSI1		20
+#define R9A07G043_PD_SSI2		21
+#define R9A07G043_PD_SSI3		22
+#define R9A07G043_PD_SRC		23
+#define R9A07G043_PD_USB0		24
+#define R9A07G043_PD_USB1		25
+#define R9A07G043_PD_USB_PHY		26
+#define R9A07G043_PD_ETHER0		27
+#define R9A07G043_PD_ETHER1		28
+#define R9A07G043_PD_I2C0		29
+#define R9A07G043_PD_I2C1		30
+#define R9A07G043_PD_I2C2		31
+#define R9A07G043_PD_I2C3		32
+#define R9A07G043_PD_SCIF0		33
+#define R9A07G043_PD_SCIF1		34
+#define R9A07G043_PD_SCIF2		35
+#define R9A07G043_PD_SCIF3		36
+#define R9A07G043_PD_SCIF4		37
+#define R9A07G043_PD_SCI0		38
+#define R9A07G043_PD_SCI1		39
+#define R9A07G043_PD_IRDA		40
+#define R9A07G043_PD_RSPI0		41
+#define R9A07G043_PD_RSPI1		42
+#define R9A07G043_PD_RSPI2		43
+#define R9A07G043_PD_CANFD		44
+#define R9A07G043_PD_ADC		45
+#define R9A07G043_PD_TSU		46
 
 #endif /* __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__ */
-- 
2.39.2


