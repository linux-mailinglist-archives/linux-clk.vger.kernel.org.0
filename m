Return-Path: <linux-clk+bounces-23923-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA421AF0AA8
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 07:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3A333A5580
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 05:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332D72222DA;
	Wed,  2 Jul 2025 05:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CUCd63pG"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89251FE44B
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433430; cv=none; b=IqRtTvFrrpCDeNboXtmMlK+VU+m8SrvemSVR8SGvf1tbVN6dwIR9D25jtvpZ875oY8oChQCF5YqHS8nkdon9CMF82CRc2Zgv0TySkbEkqjkUa3fbtc18aK+XqPVZv5PBBChipzlj7uzAVOifPLNLrBXr2J206Mfd7ECH6uXMwAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433430; c=relaxed/simple;
	bh=SIZVTA1dBlDgHWuqKkMeHUlssl6BYErjNhZuMkc2v6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRWxRUl/mJ19c47ol1g7XCXRdh4q4hYk35tqZXK9E/tgCdTS2GfdJKVwgHmSDvpNFo+epsj+34BX+EwgJVhOt05BVZqKe6Qo00OEPCoekyTHzO7JHk2JZEr4yGD6T3kncOd5bpG0AlgLhap9s2WdmAhqWBEpxeYi3duy9ehkrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CUCd63pG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23636167b30so37279095ad.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433428; x=1752038228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=CUCd63pGeGu4fUzMEvMVeiJTYiKkqwGwjNi21xlBefLtX/hUB1ogxNyQDNZrl/P1iN
         feJFYgm2b18q4Oirn5PGBEtFyvn8x70pW1I/3mFb7UdRn4q6TSlB2blJ4sChn8XmSCwQ
         s9rfXaikuXMpNZC6KVi7uZd7oO7glF9aCF2bZSSN9WdahH3lF5mQcDtLFoueSnSu/kJy
         N1t3yG3FX4dQQGGY49xs4MfXUexnM3TNJ8Ii88lno/lERrej6ydoNqAAhs1FJQ7pGOFs
         iZWFGRlI5ugSEG9Zsb3a7mzq/ytyNK2FTow2ak7ocZnGoWxWw67Ag6VCrpW/4gcrz6m4
         vvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433428; x=1752038228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=h/48+WtZZ8Myzrydn9RpWVQRnfcJ4n9Qv3zmZctj+jZiwg7F6I+bql6TgU3NSorX7P
         3k6Av7UuC3NcQFgUtauCbTHLerJH4F3mV7HZK//gWTvPNzD3o9IjiI3omSNGrthoTwbR
         Mw6QhlzmP23ge0877GEMJigpqTOQ1xBVdhTvNlGS3qWpmp7U4jWTslTD6y3A+K2D07lQ
         0JzxIDETkk/SdQIjpKtxHR8vtjzOoDd/NqGWYmdS0kqr8SXiWhkcUQuuo1O7ZQ2YzFVH
         T7QkrFIsxGS3Xad29Wp3MYMudYpWGav+B29zwgEP3TkMOsOqSZVDEjrzXYPAm0/uAJKn
         Long==
X-Forwarded-Encrypted: i=1; AJvYcCVpVMHP/OSzokwIAJzR7mqD3dPhtl2BLk1JgyB91coTFxDY+xml+6KesFmEkwADv/0OL9I4Mu04yHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK31XOTpFYdUf3bJOoG1DnKR+hE7nBqhVsy1SP0mfQ4leTw6Xu
	amMu45/7Pqhd8/Mq/RcZCrK1RsZjNMtXZGXDUWRn2CZgcg7k8nfEwL4h63HJXsJmSrQ=
X-Gm-Gg: ASbGncsl4IcFOiyydFW36/6q1vQduOrlr1tU6n9Grv/nzFibwmr5kdIlogcyesVrLV6
	0HrpE9QamQDJ+88GNBdeaDA66Mjuh+gw0K4ZzrRISQ2PG2T6sRydmOcg59FwbKB9yTydle1GuxL
	zVy03AHoC0QS5jpEUfG0Y8LUOIGaUWSrD9p8ltMWzk5/X/AxKT79vIF2K/ZwTJ1UEBLmBMfSgAf
	gs3RLuR68JcAOWURTkLzEPVq2gB81Rti8aC8IyhqyiWCZiYfbV9LD73K+b4N27xsBaTM5Y4yoWS
	hOQbao9tcoRFxoRG9baFKxDCBLstkdmNI3Ej9ea1MKrzYJt+3UkyuDfflKtsUWRd+5oj152iz5y
	HLf78OikV55zTjFOI
X-Google-Smtp-Source: AGHT+IHF9jCGgWd1zPtdr7P6gyUcMpmB+BURtwnVFT7vtNKBR1DlMS0ym17Nq8ulkiJ1AGOTzoV1rA==
X-Received: by 2002:a17:902:cf4f:b0:235:27b6:a897 with SMTP id d9443c01a7336-23c6e552a2bmr15106685ad.34.1751433427932;
        Tue, 01 Jul 2025 22:17:07 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:17:07 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Wed,  2 Jul 2025 10:43:45 +0530
Message-ID: <20250702051345.1460497-25-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bac4ea21b64..c22434a2756b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,21 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V RPMI AND MPXY DRIVERS
+M:	Rahul Pathak <rahul@summations.net>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
+F:	drivers/clk/clk-rpmi.c
+F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
+F:	include/linux/mailbox/riscv-rpmi-message.h
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0


