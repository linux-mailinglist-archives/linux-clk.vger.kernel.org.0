Return-Path: <linux-clk+bounces-4438-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E087515E
	for <lists+linux-clk@lfdr.de>; Thu,  7 Mar 2024 15:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 537961F25D50
	for <lists+linux-clk@lfdr.de>; Thu,  7 Mar 2024 14:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3607212F363;
	Thu,  7 Mar 2024 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U3yYlzhv"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA7912D775
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820472; cv=none; b=CIFlc3C+fypVq7d/xVnbVR9+bjw2wAcefo8ovQrv2QVLCtKFvEvF4FuboGm7sUztYW0nAHI7cvTK0qkTCWLxVfMciLJ6eq6fspz252kFzZjS7RhhvCyrZ0UaTLUud8K7KEaV/otS3K7Jk7Qsudx9iffnT2VAPciwD+wURGEa2jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820472; c=relaxed/simple;
	bh=qLlCiz7W0hdcFK0jY4cIVwh/ptxObe2bNd9xcfQ2FsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BUHuBSP5XgKKgr1/1uYHnSzDI+FmTY9iy8iuNYcPCuyINPS/UapvCF4OijqQbceQ1vq2ft8MmfccSl71KCKk+O4c459wV22YnXWa8QCZgdSJm83mBsE4aWgBM/NVOyLtig6uwSn7Hhwyc9oZbdgYXsC1cdbue2idnQ/txUz4sgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U3yYlzhv; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a446b5a08f0so174509066b.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2024 06:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820468; x=1710425268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASa7vpjPD0KP85hEd53eb0GhB0kI8NzMzYkNTJ/DqxM=;
        b=U3yYlzhvsEEU68Y310+n0T3P8kPUu5VgrA39lEDUtZ3pLmYvZ+dDLkX6NQ+Iiv9DpT
         5xsyCts6iQLz8Vj4cI5coPOfmihTSZNj9ii+GAHfccpTJsDRXTgZFL80OE84lb7TCpRU
         zNxEZm2cMAZ6Q3+Izg7t7U+7IyuEFLV8zi0sTxNxfCmCMlo3u319e38Q7//y0AqspDSL
         wRm9ElmGrOHL7UZF2er/WKIsHjSK9dLzz3+58L9POzWMWgMpNrK050Y3pKEPdpAE9Eoz
         GyTzqL3doub8q6P3iwY5Q/Q83DGXqIH2lwXYDC4flFEER4eJDEupB8iVSDvZGNUmZXRs
         ztNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820468; x=1710425268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASa7vpjPD0KP85hEd53eb0GhB0kI8NzMzYkNTJ/DqxM=;
        b=VrcTxbgaEdmHvDfE6+5mp5+7zGtddkJHaeaDHoHAmsITjC2S4ziA5V4pDmHX8aAJz5
         y65pBbRDgiBdmwrj1y7VEkoAcfnFk3nNrw88Ud0a8gR03aUGsBksRj4VIgDgOh0Qb7K5
         HhqZ+FLP6L1fnRvb/ksqXS1uQjK5dVm+pt8ffRNAadDohRlnqdB1gGBCDF3hiQ2dr3vx
         XTFCtEIyIfIirGdtYW10QuBVIpm/Vu0T78pyuuRMkkwvgvfnG+Zj1aLV52LcrIze65L8
         x0KxewpqDNUk4K24kWWKRp7cKmbax6IBrXGzoQ/pg0EZm8t/AVVAcR9eDw9h2i/perIB
         yl1w==
X-Forwarded-Encrypted: i=1; AJvYcCXfZnbppkVvBXz5H0dB37Mmf3iv9pQWqYgs4knJwRu9GbN1INAqWFVfkh961Kcu+WWyORLGQRUz+SN0/EHIQjUfe5U+/959Uhhu
X-Gm-Message-State: AOJu0YwvTpzraZcA/YlATgBc4bhurnG3LDumrKxh07FN4ZL5XB7ZoR0K
	7d+4AJjgCr1JYC1+DCURLzbnFGLoxWktEWTdBYUbFZICcFZe+M4DSlhOVBkbc1M=
X-Google-Smtp-Source: AGHT+IEja10YyQmxqVAW2Qm+q62IsI1kpy/uUQglfCkTPGx87ayXnWPACQi15EbUR+0fsLcWKC8Qmg==
X-Received: by 2002:a17:906:f104:b0:a45:f06:766 with SMTP id gv4-20020a170906f10400b00a450f060766mr1460298ejb.4.1709820468381;
        Thu, 07 Mar 2024 06:07:48 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:47 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 02/10] dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
Date: Thu,  7 Mar 2024 16:07:20 +0200
Message-Id: <20240307140728.190184-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G2L (R9A07G044) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v2:
- collected tag

 include/dt-bindings/clock/r9a07g044-cpg.h | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
index 0bb17ff1a01a..e209f96f92b7 100644
--- a/include/dt-bindings/clock/r9a07g044-cpg.h
+++ b/include/dt-bindings/clock/r9a07g044-cpg.h
@@ -217,4 +217,62 @@
 #define R9A07G044_ADC_ADRST_N		82
 #define R9A07G044_TSU_PRESETN		83
 
+/* Power domain IDs. */
+#define R9A07G044_PD_ALWAYS_ON		0
+#define R9A07G044_PD_GIC		1
+#define R9A07G044_PD_IA55		2
+#define R9A07G044_PD_MHU		3
+#define R9A07G044_PD_CORESIGHT		4
+#define R9A07G044_PD_SYC		5
+#define R9A07G044_PD_DMAC		6
+#define R9A07G044_PD_GTM0		7
+#define R9A07G044_PD_GTM1		8
+#define R9A07G044_PD_GTM2		9
+#define R9A07G044_PD_MTU		10
+#define R9A07G044_PD_POE3		11
+#define R9A07G044_PD_GPT		12
+#define R9A07G044_PD_POEGA		13
+#define R9A07G044_PD_POEGB		14
+#define R9A07G044_PD_POEGC		15
+#define R9A07G044_PD_POEGD		16
+#define R9A07G044_PD_WDT0		17
+#define R9A07G044_PD_WDT1		18
+#define R9A07G044_PD_SPI		19
+#define R9A07G044_PD_SDHI0		20
+#define R9A07G044_PD_SDHI1		21
+#define R9A07G044_PD_3DGE		22
+#define R9A07G044_PD_ISU		23
+#define R9A07G044_PD_VCPL4		24
+#define R9A07G044_PD_CRU		25
+#define R9A07G044_PD_MIPI_DSI		26
+#define R9A07G044_PD_LCDC		27
+#define R9A07G044_PD_SSI0		28
+#define R9A07G044_PD_SSI1		29
+#define R9A07G044_PD_SSI2		30
+#define R9A07G044_PD_SSI3		31
+#define R9A07G044_PD_SRC		32
+#define R9A07G044_PD_USB0		33
+#define R9A07G044_PD_USB1		34
+#define R9A07G044_PD_USB_PHY		35
+#define R9A07G044_PD_ETHER0		36
+#define R9A07G044_PD_ETHER1		37
+#define R9A07G044_PD_I2C0		38
+#define R9A07G044_PD_I2C1		39
+#define R9A07G044_PD_I2C2		40
+#define R9A07G044_PD_I2C3		41
+#define R9A07G044_PD_SCIF0		42
+#define R9A07G044_PD_SCIF1		43
+#define R9A07G044_PD_SCIF2		44
+#define R9A07G044_PD_SCIF3		45
+#define R9A07G044_PD_SCIF4		46
+#define R9A07G044_PD_SCI0		47
+#define R9A07G044_PD_SCI1		48
+#define R9A07G044_PD_IRDA		49
+#define R9A07G044_PD_RSPI0		50
+#define R9A07G044_PD_RSPI1		51
+#define R9A07G044_PD_RSPI2		52
+#define R9A07G044_PD_CANFD		53
+#define R9A07G044_PD_ADC		54
+#define R9A07G044_PD_TSU		55
+
 #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
-- 
2.39.2


