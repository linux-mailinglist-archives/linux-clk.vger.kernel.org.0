Return-Path: <linux-clk+bounces-11053-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4B95BA28
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2024 17:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 855281F210D1
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2024 15:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963BA1CDA25;
	Thu, 22 Aug 2024 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mKqg1pt2"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61191CCEE1
	for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340506; cv=none; b=gt/GwalNSB59DRPe2CsyTNRGLqUARSn+ajirbjrRDtMSSeK54Rm3xotzAuHTAnHJ+8bmHdg6B5YgCVxW7C18QeEz68Ry4nd0zDfrNtiGtF6ui+T0n80Rq92yPH/OgPbWqoel5OJHnxjLzVVeUtDftbHqOJre7bqu5YLgkzGCkQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340506; c=relaxed/simple;
	bh=oUH7C74aUXg4d9WGHoMwZhQPfePjjTPQlokmfgZcYd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eN+40llWatXRRJB9Nt5TWv53t8DHmtQBOBV9T/Fz0mhj9flVSnbYnrjPSfveleOA2gtweMscXaCo9zBEh/HOa/w/ipKrVIgETOtBucoaM4lmXCXQ4DEs1Qdt7gCWgY7FFWjK9GmcJAZg0kNOWFXLmS+AG6bsuD46QAUCMeIRuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mKqg1pt2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so93826866b.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340502; x=1724945302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3txPUwxmR4fX7LzFPWhcfk9alhQ/U1SsqoBALbg0+o8=;
        b=mKqg1pt2CZoeMwJSMruM8a17QtgxTEL/9SW2A8WWiIiBytZ0TE5SJFBmXExsU4b4o8
         5Jj64i2giRaz7mnQdzHI09fR0Xud9AmUB/N9Y23AHXTLJm4K07WksJgUel67snJUyzGf
         6KQ2ZjTI/fn3x2zn0nopq8djlkXlLb5H6Auw/+qSBpCY1SpfggSL6T42xMfl6X3eQ2lj
         MPJrPPW/USTI1VdKjHYf8kqSwYKlLKK9W27sVOkrJd+O9RejkWYYd9W4Istu5XKEv2kW
         7KOdagtfDbjKhdOdPL9MMSGu9Kdnf/wIWHHo4XVXy+r2W/ZpgcXAelfUdATU+P857P1d
         9g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340502; x=1724945302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3txPUwxmR4fX7LzFPWhcfk9alhQ/U1SsqoBALbg0+o8=;
        b=JZmOo1qIiM+Xk6m7bAV1iNOgGdwNjdXHgs6edv+IePynfX1T1vAo3dGbyvFLxQjsNb
         BJ47RKx3yR/VRgq6HeRJyaCAJzOuWvfRvPgYBzmvAieTLkPMeStL/Md/QejR/+vsGVSf
         JwryHi1wbljyK2WrWth6GSxk0yuKosBHg/S0sgeSKH3HNdDt/K1lB+FQt6M7KJZ0jNtE
         G/h4LUQ2oMfGOzLvL+SlAemiSOiR0cdi8GEMzfqMR2EsuinMOR3H9dWVJ/2Agyo/HYB7
         AUgexN61SeKULSq6xOo3g2rR7X4G3gTcUoOOGHzC4mHtP4p/lYqXTzMaHYFVmTdnYqdJ
         Mj1A==
X-Forwarded-Encrypted: i=1; AJvYcCWEQlI12OXDmkKjn2I8N5nS4ny90aKcMn47bid44iFJEhKxURoPIoQ1PHZpzIJFwNVZG1nOXEkyf3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWNk4LtWQkJuxBKH+GudxCxUxO/+42rVtRbxI4C8ONcEl8m7jS
	jLQHs/usTNcmz6fpuxEgtElCf59979VEhhRCLrqvCxZoSI0YEAHTQ0Oc0Is1gOU=
X-Google-Smtp-Source: AGHT+IGwmGUufY0I/wXnuKumGBXx6MTOJSx969Oopy4E3RE8Z417JclZShJ68eMp0wCAWKbVhUr4SA==
X-Received: by 2002:a17:907:efd2:b0:a86:3c01:cf08 with SMTP id a640c23a62f3a-a866f705025mr477276566b.47.1724340502213;
        Thu, 22 Aug 2024 08:28:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:21 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 03/16] dt-bindings: reset: renesas,r9a08g045-sysc: Add reset IDs for RZ/G3S SYSC reset
Date: Thu, 22 Aug 2024 18:27:48 +0300
Message-Id: <20240822152801.602318-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add reset IDs for the Renesas RZ/G3S SYSC reset controller driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 include/dt-bindings/reset/renesas,r9a08g045-sysc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 include/dt-bindings/reset/renesas,r9a08g045-sysc.h

diff --git a/include/dt-bindings/reset/renesas,r9a08g045-sysc.h b/include/dt-bindings/reset/renesas,r9a08g045-sysc.h
new file mode 100644
index 000000000000..675872a32121
--- /dev/null
+++ b/include/dt-bindings/reset/renesas,r9a08g045-sysc.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_RESET_R9A08G045_SYSC_H
+#define __DT_BINDINGS_RESET_R9A08G045_SYSC_H
+
+#define R9A08G045_SYSC_RESET_USB	0
+#define R9A08G045_SYSC_RESET_PCIE	1
+
+#endif /* __DT_BINDINGS_RESET_SAMA7G5_H */
+
-- 
2.39.2


