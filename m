Return-Path: <linux-clk+bounces-25204-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB44DB137F6
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jul 2025 11:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60040188458E
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jul 2025 09:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BCC2566D9;
	Mon, 28 Jul 2025 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TBHlR5tw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B882586DA
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695798; cv=none; b=q2WqoesbssRFyUTQaWG7H92KFGrwyIAGd1chfM+/x72FygS4kaJy/sanisHeWbYZNmizQdq/7hGucvTEkMfYacMd/OBlG9c8db/FzSCapN1YrIGxGDmPadg28UaVqYSk9RwlvaaZRTkg1LlTe6/nMh3FblnqD7YBon67vxBNXE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695798; c=relaxed/simple;
	bh=AzDnkvkLdRyeS7VDWrPZhFEpyPeN7AYdoKFUiRxG/uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5kZxq5Yvx/P3kSpJ8TDbQHft4Qm2IFcISgV+icMtE2us4+mdmib6wGUTYmuRd3ZAqUnPAmD5Z9TnaceySFNQxLGsDWHrXnOaEeLqPIVaUxw+8oOMFXgewOXAf614bvc9jfb+KYS3IK4O9qPZzNH1KQtQ8D0FH7lD1qQ1evm8+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TBHlR5tw; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso3645098a12.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695796; x=1754300596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=;
        b=TBHlR5tw76+MK5suLBWY7bwblTkjtVgCJq8UhERGZT4qrofiI93ua/58rdFJWkedgY
         rVBaNiXRN8iP1yt2E88Yd843IMDB7fsr6Ptkyuyq8yehyBk93mSLR8mbXXXur5yfl70h
         xZcGIrzALP/w3sbJOUiMlExBxpg6HetcMBoZMm8DhhW4eVHceHxaWcebeUkmLhNAZT8Z
         rkRVr+CIdusxP0aH7iT6pmK/mN7ZjSMObY7AoNK+0WCbtSjmRCrfGNGltHGLcsCl5iMu
         mSTs48tUfFtW0rBdj3TBCEOeCroZh4uXRHSOPEtpDlTU8I0G4F7W53J+9jeiQAdXsXF7
         KMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695796; x=1754300596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=;
        b=UtmZobvJdXLXHG3E4Fcs3IzOvWshUeOqg5O7MaYiIJ4cbCtjVVMFuucB0+EtMLTer3
         2yXvFGA2QNWhh0LyyDGw2CKITMY1Sdi2VEhvUIWVbENs3lsNph36eWqvgT5N+XwzRmZj
         06hugsySOtNAhWwwoEc+/u+IKngy1GWqYT6ujNirOX81ONvYMXo3DpVd57Ad9AlFXRqE
         rUmlU+8b3l0x5JB2oIwa4A3bLEL2Xj8ZGBsUDRAav5fr+1ceOImFio6fMLKndBsEowEV
         slVtr5g18ZmUmuxpFrlrs/ncWwsjQSBV5pmFW0bmEi3acD+Gpbwit2wO7XRNvjne2tAV
         TZHg==
X-Forwarded-Encrypted: i=1; AJvYcCV/8/YQiYYQzFjmL9BOs5WoW4M19KKv+m37PQdU9BkPXN9aWoyO9q/u32zlpSsEuUzL8x6DckQmdpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9KrlOviRY+HGGf4zbp9ZJ4mdBe/zhwwhiUBDFjm/1aPiVSVrt
	5mKdshWJUiX4J2ovElbpmWyAyb21dG+LeGuQZMFF6jj5BzQLca+jZugYTm81RY0B/xM=
X-Gm-Gg: ASbGncva/TLubgeWALPiTBCuFK+rvVwCT5P6KsjjsnwM3/aplh5A5GV/luRyKhUN17A
	seEA/3hLBVCi+jQBy6z0SI6/aGLEfwsjrO8wV6ZmbiQ6p1tVuSXToRr6rNJJ8feuVCEZ+rIsWDj
	c/pGVMRTq5+LnGLraKGuhe3ZdqRtSlBMdmqZcRXy+njmgY9sjYwxiLSyhetAfeFNcWxb55yEofN
	n8RmcD+WJAHET1W9vO9UH71JgQ/2syxyJQccYTDLyWTQzaqyQ7W9jXPdTGg2/62+kBbrmtwP+L6
	rJRaUY5pAcVYIETu90E/vD5lZVvRnE60QADRhoJMytuxN6CsxpqumLpLTWbXHBw7J8gBqHsPpqW
	qBm0b6mV2uaZNg+ur0Lo9Ev8V+u2Pgn+K8ikLWaxRTftJggZnsSyR1P4KpoN6d2oacSHGNdU=
X-Google-Smtp-Source: AGHT+IHL9arQT5aDqAz1dZ7cvYy38Ns9Xdix/MnurcSEyrOlJ5A4rj3vvzb2xougKwWOpnOXJIDzwQ==
X-Received: by 2002:a17:90b:3d46:b0:312:daf3:bac9 with SMTP id 98e67ed59e1d1-31e77a32a3emr13516455a91.34.1753695795553;
        Mon, 28 Jul 2025 02:43:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:15 -0700 (PDT)
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
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v9 14/24] ACPI: property: Refactor acpi_fwnode_get_reference_args() to support nargs_prop
Date: Mon, 28 Jul 2025 15:10:22 +0530
Message-ID: <20250728094032.63545-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, acpi_fwnode_get_reference_args() delegates to the internal
function __acpi_node_get_property_reference() to retrieve property
references. However, this function does not handle the nargs_prop (cells
property) parameter, and instead expects the number of arguments (nargs)
to be known or hardcoded.

As a result, when fwnode_property_get_reference_args() is used with a
valid nargs_prop, the ACPI backend ignores it, whereas the Device Tree
(DT) backend uses the #*-cells property from the reference node to
determine the number of arguments dynamically.

To support the nargs_prop in ACPI, refactor the code as follows:

- Move the implementation from __acpi_node_get_property_reference()
  into acpi_fwnode_get_reference_args().

- Update __acpi_node_get_property_reference() to call the (now updated)
  acpi_fwnode_get_reference_args() passing NULL as nargs_prop to keep
  the behavior of __acpi_node_get_property_reference() intact.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c | 101 ++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 51 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 436019d96027..d4863746fb11 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,45 +882,10 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
-/**
- * __acpi_node_get_property_reference - returns handle to the referenced object
- * @fwnode: Firmware node to get the property from
- * @propname: Name of the property
- * @index: Index of the reference to return
- * @num_args: Maximum number of arguments after each reference
- * @args: Location to store the returned reference with optional arguments
- *	  (may be NULL)
- *
- * Find property with @name, verifify that it is a package containing at least
- * one object reference and if so, store the ACPI device object pointer to the
- * target object in @args->adev.  If the reference includes arguments, store
- * them in the @args->args[] array.
- *
- * If there's more than one reference in the property value package, @index is
- * used to select the one to return.
- *
- * It is possible to leave holes in the property value set like in the
- * example below:
- *
- * Package () {
- *     "cs-gpios",
- *     Package () {
- *        ^GPIO, 19, 0, 0,
- *        ^GPIO, 20, 0, 0,
- *        0,
- *        ^GPIO, 21, 0, 0,
- *     }
- * }
- *
- * Calling this function with index %2 or index %3 return %-ENOENT. If the
- * property does not contain any more values %-ENOENT is returned. The NULL
- * entry must be single integer and preferably contain value %0.
- *
- * Return: %0 on success, negative error code on failure.
- */
-int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-	const char *propname, size_t index, size_t num_args,
-	struct fwnode_reference_args *args)
+static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
+					  const char *propname, const char *nargs_prop,
+					  unsigned int args_count, unsigned int index,
+					  struct fwnode_reference_args *args)
 {
 	const union acpi_object *element, *end;
 	const union acpi_object *obj;
@@ -999,7 +964,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, num_args);
+						&element, end, args_count);
 			if (ret < 0)
 				return ret;
 
@@ -1017,7 +982,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						ref_fwnode, &element, end,
-						num_args);
+						args_count);
 			if (ret < 0)
 				return ret;
 
@@ -1039,6 +1004,50 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 	return -ENOENT;
 }
+
+/**
+ * __acpi_node_get_property_reference - returns handle to the referenced object
+ * @fwnode: Firmware node to get the property from
+ * @propname: Name of the property
+ * @index: Index of the reference to return
+ * @num_args: Maximum number of arguments after each reference
+ * @args: Location to store the returned reference with optional arguments
+ *	  (may be NULL)
+ *
+ * Find property with @name, verifify that it is a package containing at least
+ * one object reference and if so, store the ACPI device object pointer to the
+ * target object in @args->adev.  If the reference includes arguments, store
+ * them in the @args->args[] array.
+ *
+ * If there's more than one reference in the property value package, @index is
+ * used to select the one to return.
+ *
+ * It is possible to leave holes in the property value set like in the
+ * example below:
+ *
+ * Package () {
+ *     "cs-gpios",
+ *     Package () {
+ *        ^GPIO, 19, 0, 0,
+ *        ^GPIO, 20, 0, 0,
+ *        0,
+ *        ^GPIO, 21, 0, 0,
+ *     }
+ * }
+ *
+ * Calling this function with index %2 or index %3 return %-ENOENT. If the
+ * property does not contain any more values %-ENOENT is returned. The NULL
+ * entry must be single integer and preferably contain value %0.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
+				       const char *propname, size_t index,
+				       size_t num_args,
+				       struct fwnode_reference_args *args)
+{
+	return acpi_fwnode_get_reference_args(fwnode, propname, NULL, index, num_args, args);
+}
 EXPORT_SYMBOL_GPL(__acpi_node_get_property_reference);
 
 static int acpi_data_prop_read_single(const struct acpi_device_data *data,
@@ -1558,16 +1567,6 @@ acpi_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 				   val, nval);
 }
 
-static int
-acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
-			       const char *prop, const char *nargs_prop,
-			       unsigned int args_count, unsigned int index,
-			       struct fwnode_reference_args *args)
-{
-	return __acpi_node_get_property_reference(fwnode, prop, index,
-						  args_count, args);
-}
-
 static const char *acpi_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	const struct acpi_device *adev;
-- 
2.43.0


