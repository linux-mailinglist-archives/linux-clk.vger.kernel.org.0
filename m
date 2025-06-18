Return-Path: <linux-clk+bounces-23178-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69163ADEBC5
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 14:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BAFC1894680
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 12:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC562E3AFB;
	Wed, 18 Jun 2025 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EUspiqLV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDFF2DFF2C
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248995; cv=none; b=CdiLjopcy7TQaZd33iHaWsd5lZylL/dd1P7GFOIYEwKIsefuU/Rs5yBQDreYQFKarYfgbUqDIU+hk9LleLsbtYjvQ9++bThDxwx8Kk2saH2SdTHLQRJeHeisDYY0GaIUd7zxfbH3Ge0ziAhKDtY6THt7QjXb/1wdwL7Ah19B+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248995; c=relaxed/simple;
	bh=uLkW3DQcKIIgVHib4AKQIVSEPy4uT4MPjoilFNj5tRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adT1Cbhg8EInqbrVo1xW0EN4yG0rE5BjJEcjwsmPkdYinTD5+SbDs7k+X1/hWGH7MJvCAgLiMd2/iXjcvLQgQdYM4G5F+88zvLjcWQpRPqZfa4kNZX2qgIC9KDSfeQeZKABn1CCuGPXLvMi/a5fQ92dmPFFxlEtDsIayov4d5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EUspiqLV; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-879d2e419b9so6580005a12.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248993; x=1750853793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=EUspiqLVIvB5+2Q1jsOuu0av3HbQPNe8KIajUCJpCI46mnPksI891WJGeE5sC61wHi
         560c1pVVwMDJQ/qqo0zymjMfyf0HGtXwdr0RGneKmFQwlH8aN34lMoRqaA1N72PyNqO2
         gkjE96mogcj4NrOP4+akdHVNUkHk5CmGa1xhSjvUZLeGPcly6uKTq7JeodO6/OHg1lkB
         WEAjPm8c44ebIRu/BcUUA8Mmg+finBsSVbeOY74LhiLFOppQZD0XKrmYGFNW6cYXUdoq
         lM8HlYNiCK1jPSSKumCx1I0aYsdxEgbOgLj6VTGMOvG19I598B9bKL9j77LUOOBk70ty
         vzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248993; x=1750853793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=rHaafPR11XoYPzKjoBfsBFq8CdxLYivB02jwG7aIXkHiNrm8vdYrMvC4RcxWxpAR4f
         ExCjbojAmBMw1SjG6ZSq3zJOgprA0FmY5RO4j5JJSSKS5PpN1v5ZEV/zrvy1u9+ypcI2
         eqUTsTMHag4r6BfCW8iX4c+edMvTYleSBeqggO7U3et7+ij38RuCSFCv5Dw8aU8muBZy
         o6nAm1/pwFS63Z3aDIfvGmoqxDkeWa3j4xsExKzzSL46qsCZtm0liSmcpB3y/hZFM7q0
         nFWY0BhpJLayxaan+2GRAUpEXJC1CfWTOqt8iqRvy3aH+l3h8dTBmkXPLE7cMg3tiMd6
         KZwA==
X-Forwarded-Encrypted: i=1; AJvYcCW9OxSgnYoS3I32iqYW9kI9BrJmMG8t3d3eQBjXDmuQUQ2D3FE35JUgLLmV9PVlDOYuwXb+Xv1lJuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1qB3K9Qkz+Ew4IF5ecX9KVkZXeVKxlcaAkbTNYZpaap9OxA+
	PqjeDEdvIxHp4MPb5zaLD6NDJo6K3i4w44nSHZIfOr8bEPrA1nvvCpIY2LbDzBSg28I=
X-Gm-Gg: ASbGncuRg9hkun3A6mjXJrDv/T4SjUQroDwLndB+245gCZEH6Wh9I9++1L48to8yNEV
	jfzyQTOnWS4J3VHA4sWx1B8dw/JMJW72GuStBRe97r98fR2dUwVcZWhWe4xAwAUDyxjxFkwY43W
	hTu1Al9wE3STgatCP0iw6OrdUBrdfEzLseob+rtoWQFmaO/iFj/R8KriGwr4azJ3bSXhaR7P21b
	FgzxMTMvJ0pXBYBE4x9LnxV7uxe2vjAaMTnP/xXQ2mGG87n08AMU8/IGWmEduSZSUoqrI/Zan5C
	vkOMFg21NrUfnftu9np63qzkKmVpogT6N5NMeacVgBJE5R3OfAVL5jRonGH7YBWbEKU3F2GV/ho
	Nv7faFrcx5Z8YtZ6Y/Q==
X-Google-Smtp-Source: AGHT+IHwjSX/UY3bVpxGP5NviX4zYZWa4ulipSV5sKhfmblor2hgMtTZAatndUzhakZYZeOzNsQJuw==
X-Received: by 2002:a05:6a21:3283:b0:21c:fea4:60e2 with SMTP id adf61e73a8af0-21fbd50703amr29528863637.3.1750248992905;
        Wed, 18 Jun 2025 05:16:32 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:32 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 16/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Wed, 18 Jun 2025 17:43:51 +0530
Message-ID: <20250618121358.503781-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, the interrupt controller list is created without any order.
Create the list sorted with the GSI base of the interrupt controllers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..33c073e2e71d 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -115,7 +115,7 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element;
+	struct riscv_ext_intc_list *ext_intc_element, *node;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
@@ -125,7 +125,12 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	list_add_tail(&ext_intc_element->list, &node->list);
 	return 0;
 }
 
-- 
2.43.0


