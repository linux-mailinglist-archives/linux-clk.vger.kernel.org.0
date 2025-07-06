Return-Path: <linux-clk+bounces-23914-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3210AF0A77
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 07:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AF7E1C01FE7
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 05:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2970B22A1E6;
	Wed,  2 Jul 2025 05:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TkeEvLIW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D0322A4EE
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433363; cv=none; b=KuWeRc/xMddDTDQkFG8/4DFXk2wAuo+nrJ3DTR3GAqsm8V82IF8HgglJuJeFkzZTrlpASXyaaulLWWJkKFa/r7xm7cTATN1e87Tp/RCuYUsU0eFFn0Yz/crn+Ig4rst4iP8DSS/zWp0qCpuhO8HjS7AoMswZrcUFlOSCZpkkIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433363; c=relaxed/simple;
	bh=jN6vr49WydQekpKegVkjH3kRWbiat3b6Jw7xzzte404=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwbMNVfdPKohQs8HylJQdsYr0iiIcJxwzzCBNltOGzgHshxmZnver7HFtwUVjxuhToeVSdA73PO8O9JQWK5jEuJOY580/DD/VvYu/fyQpXhMsIXLHmeuXRqTgQ3H5XeqJqztMxxDXhQ6QmXivRElz2axF8Lr05KwwJDMgDtoY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TkeEvLIW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23649faf69fso36000925ad.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433361; x=1752038161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmlL9kMvvcYcWlU45z5MYmmVSDmE1amNKft2tyH29n8=;
        b=TkeEvLIWFDN+/Cx7PbRqqnWqGlFU9US+Q4PiaWrRD9Y76t41oG3Laeb507aBjoY0Ei
         sADyFMM2mrrlv3IK0NPUFJsgqekO15ClMFT0wW5U2lO/LV/wrudF4x8YbncksRcGkw4Z
         wzKhrzPifSPxhqex94PS5/bUtj0vk9zYC4k/aOq8yLo3iX9oOCnq/x2LWsqxme+83kyw
         lsPA99a0dLUvaA1sra0BRGmiKA3oWAChSuKmOh3QZpmRVsCdVO54gSWUR3c3TUYkOqN+
         TPk4lyaQgKHIAgkuIW0HPmu7tQEDnrNv9oMba0HDWyE/qSSemVmEZYaAdgyyOISMi1tf
         qqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433361; x=1752038161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmlL9kMvvcYcWlU45z5MYmmVSDmE1amNKft2tyH29n8=;
        b=wjYRuNscNXm72FZZkAHXaINM1fgDASy5+OPgCZECWkyofa2cpTGp7E4JnRSAJsmDLH
         +LflHAiDaK4B7BzCcxeHtoZuUw58YB5eAE/kvLWbSYH/NHT5y8LgkR3yCVI34hf93pNs
         GzsoH6Hj3C5iRL1P1n/E2Pt2QvUfeaqy6aQQ8lomEGJQ15P2CX0hU42XpMaA2BywqMKW
         FHOvfM40M7YPZpViwVKovWXdl4t5C2V8NNBMPtLLcQdYMx+cr6FZaz27n7QPNrk8fiZT
         Ma7agRRcKzZMg1qGcK7d4c/8I7VwX6lxlnTtGrZoRjbHkjo9oKpr8AQQEp1aCDsNLvp8
         lmAg==
X-Forwarded-Encrypted: i=1; AJvYcCUHy1nmk9ZiyVsJfCfBa+NLV7z4gzJOPC8b4r860dv/dPENcD5V/ImHoFzpZ7KqWYdB2rff/7bzppA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKO6n8sYxVi2nsVtgUilqL+EVDmSAaMZMVPqv87hgPTVjRbKuJ
	cfFUZLaqzrIYZiYy0Bh55kzcY1pkZS+/B+/hkDMwLHam4v1OMXY8ZpcfCFLpvRN9ouc=
X-Gm-Gg: ASbGnctPROX5GzqSBvOCxS3oDQ/eKXWYQvicfJ3YMfBX5UAp/eCHacCTMDB534QqvPy
	M/8FSzLgEoX22TRdiJc6J15lJh3NrZiKUNZOonvLN6xVTtA9dmtOz/ikYcYH9xIGV6n/0ZN62v2
	zTHyqiy3H0nJKXihqlpu/aCB5NJ43siaSZPZlQnHgB06qMN0ipuMH0vQusrc1xSNgDJ0V+HkaAa
	EjFIyVoz2kEap+Vb0+heyscWOyVjDEQ/3X4rIJDbT2UpYwIyyWJltItHfAhqHEWwqQHlySI1yjo
	7N0m5Gdh9xbX0Hc2bAvbYElJHy6yRzBuGEiqMTPd1yMtSfnRida+qfF8F0WfKbhIHdF3niHABpf
	33rzDvvW+0mX1M6hD
X-Google-Smtp-Source: AGHT+IE1P7SGRwHhgK16MRfDAXrEX7DH1YLnpHg6sa/GNFGZg6KWOiAXLcWOV6zX2nV96zG+z8muGg==
X-Received: by 2002:a17:903:3c47:b0:235:f143:9b07 with SMTP id d9443c01a7336-23c6e483a2fmr24735045ad.5.1751433360617;
        Tue, 01 Jul 2025 22:16:00 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:00 -0700 (PDT)
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
Subject: [PATCH v7 15/24] ACPI: property: Add support for cells property
Date: Wed,  2 Jul 2025 10:43:36 +0530
Message-ID: <20250702051345.1460497-16-apatel@ventanamicro.com>
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

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, ACPI doesn't support cells property when
fwnode_property_get_reference_args() is called. ACPI always expects
the number of arguments to be passed. However, the above mentioned
call being a common interface for OF and ACPI, it is better to have
single calling convention which works for both. Hence, add support
for cells property on the reference device to get the number of
arguments dynamically.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c | 22 ++++++++++++++++++----
 drivers/base/property.c |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index d4863746fb11..d08b0ea5c915 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,6 +882,17 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
+static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
+					       const char *nargs_prop)
+{
+	const union acpi_object *obj;
+
+	if (acpi_dev_get_property(device, nargs_prop, ACPI_TYPE_INTEGER, &obj))
+		return 0;
+
+	return obj->integer.value;
+}
+
 static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 					  const char *propname, const char *nargs_prop,
 					  unsigned int args_count, unsigned int index,
@@ -892,6 +903,7 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	const struct acpi_device_data *data;
 	struct fwnode_handle *ref_fwnode;
 	struct acpi_device *device;
+	unsigned int nargs_count;
 	int ret, idx = 0;
 
 	data = acpi_device_data_of_node(fwnode);
@@ -960,11 +972,12 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!device)
 				return -EINVAL;
 
+			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, args_count);
+						&element, end,
+						nargs_count ? nargs_count : args_count);
 			if (ret < 0)
 				return ret;
 
@@ -978,11 +991,12 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!ref_fwnode)
 				return -EINVAL;
 
+			device = to_acpi_device_node(ref_fwnode);
+			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						ref_fwnode, &element, end,
-						args_count);
+						nargs_count ? nargs_count : args_count);
 			if (ret < 0)
 				return ret;
 
diff --git a/drivers/base/property.c b/drivers/base/property.c
index f626d5bbe806..6a63860579dd 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -578,7 +578,7 @@ EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
  * @prop:	The name of the property
  * @nargs_prop:	The name of the property telling the number of
  *		arguments in the referred node. NULL if @nargs is known,
- *		otherwise @nargs is ignored. Only relevant on OF.
+ *		otherwise @nargs is ignored.
  * @nargs:	Number of arguments. Ignored if @nargs_prop is non-NULL.
  * @index:	Index of the reference, from zero onwards.
  * @args:	Result structure with reference and integer arguments.
-- 
2.43.0


