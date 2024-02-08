Return-Path: <linux-clk+bounces-3445-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4CA84E0F5
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 13:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B869287346
	for <lists+linux-clk@lfdr.de>; Thu,  8 Feb 2024 12:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5D277F39;
	Thu,  8 Feb 2024 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Umz37Cnx"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45037602C
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396237; cv=none; b=LsCbHdgv6Llo42RfvFFpAOQC2VehAEYyaw1DHdDLH1mjn4SLtod7SnICT13T2C3totXP/0HbKvbXu5UV/LEmdE2pocDWtGwN1vm6gyltMQ83zg4CB0LlcJGodGt+w1PXHNlWqoqaBtRJyu8Fr2MJZTQEV5c1jJGah42JhpiQWdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396237; c=relaxed/simple;
	bh=EF1WGTgc7B/wPwokfhje4eT/Mebr8tr92pDDPkfm3H4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tqYYzxKvzEBAhGVC6e1Bj+M/Jvt09hJw7ztOYNbKKE2QASa0IgLH+1Q0b/5ggRaquRcTkBzI7no+x2DzvLm+qIac48UvO5h0Yg+eS2KxbW86lFtSt6CK5OFiMiFckw2JrtysKSAww/0+vAQ1WhQHLy/jMxyIZ3HiD/oM2m3l8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Umz37Cnx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4100826df08so15332035e9.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Feb 2024 04:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396234; x=1708001034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVbMwB0TiglM9Jy2bve9nHK/i2B3Um4Ecj9XE9vae54=;
        b=Umz37CnxP9SO9Kcfxob2hndUOWMrpMtJi2LquUe+j3yv/jiGt1VnClGx3DEBQRt04G
         ih2wSFvQ7+0NjqVrjGvcELLFLRvafrm7m+JVBL5WDNTiNpjamxAwBu7vh1Jhfo6P3CFx
         RB6QaBl0yAXLGlE5Tz6oUKkQocjn1BEFlUxMu2KpsWhyLEPhAB3eMZWiKfeoCg1O5BsB
         neqDyfn/4GKjq1xKa8eMX992pt548jTzIAyJpXRL5aHwOl+Wnxy0fUZhMbpySCGZL0WC
         qTAEy4xDiBl0cnW4DA7sscgZ6FYu7V5sPtvc6vToOxD1OxinUoSOx/MAgj+wVvldMB5A
         W8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396234; x=1708001034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVbMwB0TiglM9Jy2bve9nHK/i2B3Um4Ecj9XE9vae54=;
        b=Ym/zgpGG3YNs3i4IzvugKKC2VSx2wHkdUqrqerLmhu2Clbt3aS9qK9r2WWHeHtUHeo
         N4mQBCiUKMTIevVIk/SPIoXS+RnukXg1uhF9cUi+AOQZXFcJl0CNSADTKKWxO3OlcUl2
         eEwBX8PDT+TN4bic/xFoo0ah1CUKJVMFQK8fNZ1H3XQcuRWfIvXE0V/Bkj7va9j/9CnG
         4y20wnW9+WN2AzkHcDgSRpb5LZt9iFtd8XUSNnrFlL9fSJijN3rF65ExbfN0tE0b3zrB
         LhyAhrh6nr6lLgTHHeuexc3fsnQbrVhqsbszNrKSjWerN5TlEbu8Rb+B4hcOBqUx6Z7L
         Ve6g==
X-Gm-Message-State: AOJu0YzMUqqg7CN7B3kxXm9jpZuCX3RkopvTVg1pmR0RmMSq/EaMloin
	pZNulesujfrZ/DMP96Z7QhS46BD7S2u1FnvpdOLY5R5mWwAsnN9IE/9kObyMKRQ=
X-Google-Smtp-Source: AGHT+IFGzF9o2pTF9T3Gci4TSPWcIsOUNfNbwJnaBk6HW7gCXyCkEcJabWF2d2a4zsvkUeM6h7+Pow==
X-Received: by 2002:a05:600c:1e1d:b0:40f:f4b2:b26 with SMTP id ay29-20020a05600c1e1d00b0040ff4b20b26mr5738131wmb.25.1707396233978;
        Thu, 08 Feb 2024 04:43:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+k3ak3Q1EAZ44zAFQPvAThcwM466bhXPNIxXdC0k+54Ou7Zc12txWb58P6bsgdd6OT/w183dgapwgULEVG/ja7p/6VXKOKpT+MtV6ONpsgZU22nzt5NFnpcivsGxTLBsffy2XBOkR6aygjtY2sYYajYX570vNa6itMviKmUW3M5dIhgxqAheRT4dzyGXIksavPo2IdYe+20QSO946qX3hna55YZvGE5mRX2dO+yzE+EEcZBUJPUY25g6hTXPYi9ZwW+nqXLtFXFhjczn0qcibAomrERJzAJ9Bd2PYioQ7Rjs8wywIlbk4UxTI2V0l40yeWyyKcrZwtn2yN1u8icvnREZZEt+tIcHVRX+DMADriAAGj8+htO/QbKMRtYapriyn2R9RfS25WNfbCk6024l4bftl0+DZ+rTGhZ8w7kuA64+GGvLU18c2NV2HIOeYW+Ki68P7icEAi5t2b1tk7nMqJKKohxeJOvpJWEbDkt+aXWJNYXAHajWum7ELpdGlfL76g0x6l1a8oUVR+d7xN13hVXNOI8m6pEBxETYCVGNGYRJ3oBo/WrzYMdk9niAjtvc=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:53 -0800 (PST)
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
Subject: [PATCH 05/17] dt-bindings: clock: r9a09g011-cpg: Add always-on power domain IDs
Date: Thu,  8 Feb 2024 14:42:48 +0200
Message-Id: <20240208124300.2740313-6-claudiu.beznea.uj@bp.renesas.com>
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

Add always-on power domain ID for RZ/V2M (R9A09G011) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a09g011-cpg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/r9a09g011-cpg.h b/include/dt-bindings/clock/r9a09g011-cpg.h
index 41dd585d7115..250499faf049 100644
--- a/include/dt-bindings/clock/r9a09g011-cpg.h
+++ b/include/dt-bindings/clock/r9a09g011-cpg.h
@@ -349,4 +349,7 @@
 #define R9A09G011_DDI_RESET		93
 #define R9A09G011_DDI_RESETN_APB	94
 
+/* Power domain IDs. */
+#define R9A09G011_PD_ALWAYS_ON		0
+
 #endif /* __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__ */
-- 
2.39.2


