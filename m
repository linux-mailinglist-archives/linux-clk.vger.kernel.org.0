Return-Path: <linux-clk+bounces-4374-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B8871CC3
	for <lists+linux-clk@lfdr.de>; Tue,  5 Mar 2024 12:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 461C0282F5E
	for <lists+linux-clk@lfdr.de>; Tue,  5 Mar 2024 11:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3905D46A;
	Tue,  5 Mar 2024 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c200yyKI"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942D15CDF4
	for <linux-clk@vger.kernel.org>; Tue,  5 Mar 2024 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636379; cv=none; b=NbWR4plSqjyENdUkWdEzB9f909ZbCUnwWLjeVj03iXU/rX1WNgKrMNvsWxQbOGE37oIAlnJzqIB3hehEyikgpfUUKgZbg+Rk8HaqWZ9G9u8MDclxdrDT/vfkmboLqTB/YJ4lrVkT3soAuAYWQhvRqR31a09gwh3UtyoNrWO40AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636379; c=relaxed/simple;
	bh=VlgopJb3HB9gqI9ngX3wzrzF9oM1w3fcSYK4kzltIPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXpNDk2AqfDHWAUMbLrX/fBNucsmqYMSc9Bq3b7H3EGge4MXG9EBubOnavfgL6AbE5j5WKqalnDSg98DjLjJ+AQ9af6Mk+PgHeXn/y2YS2l6Msw5pXzqCEaTJC2sZOxXFbpS31DiLZDRT7cslkSK1jY7eTnvRtG1Q6JWZr/KV44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c200yyKI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709636376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u032h4X6Qt+++To0O90WQzL/V0VDVe/ibgESlXZOwkM=;
	b=c200yyKI0BwTfCvBu7OQO9yKK++bRC56DSkHLQetR/uP7n8u1yjl7GThRuLi32KYHhFpn/
	QeUAO2sO7UK6bH+YwINCoUwR3frZCqAEfqaspkzmvjlIHzrr+2WM3XIH7EEBrL6Yb1veSk
	nDED1XfvU6eJ92Ymary8CXhITXp30dM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-330-JSlummHUNsq8nqZh2C0AVw-1; Tue,
 05 Mar 2024 05:59:31 -0500
X-MC-Unique: JSlummHUNsq8nqZh2C0AVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 070DE1C02C97;
	Tue,  5 Mar 2024 10:59:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3600D1C05E1C;
	Tue,  5 Mar 2024 10:59:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 2/5] platform/x86: pmc_atom: Annotate d3_sts register bit defines
Date: Tue,  5 Mar 2024 11:59:12 +0100
Message-ID: <20240305105915.76242-3-hdegoede@redhat.com>
In-Reply-To: <20240305105915.76242-1-hdegoede@redhat.com>
References: <20240305105915.76242-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

The include/linux/platform_data/x86/pmc_atom.h d3_sts register bit defines
are named after how these bits are used on Bay Trail devices.

On Cherry Trail (CHT) devices some of these bits have a different meaning
according to the datasheet.

At a comment to the defines for bits which have a different meaning
on Cherry Trail devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/platform_data/x86/pmc_atom.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/platform_data/x86/pmc_atom.h b/include/linux/platform_data/x86/pmc_atom.h
index 557622ef0390..161e4bc1c9ee 100644
--- a/include/linux/platform_data/x86/pmc_atom.h
+++ b/include/linux/platform_data/x86/pmc_atom.h
@@ -117,14 +117,14 @@
 #define	BIT_SCC_SDIO		BIT(9)
 #define	BIT_SCC_SDCARD		BIT(10)
 #define	BIT_SCC_MIPI		BIT(11)
-#define	BIT_HDA			BIT(12)
+#define	BIT_HDA			BIT(12) /* CHT datasheet: reserved */
 #define	BIT_LPE			BIT(13)
 #define	BIT_OTG			BIT(14)
-#define	BIT_USH			BIT(15)
-#define	BIT_GBE			BIT(16)
-#define	BIT_SATA		BIT(17)
-#define	BIT_USB_EHCI		BIT(18)
-#define	BIT_SEC			BIT(19)
+#define	BIT_USH			BIT(15) /* CHT datasheet: reserved */
+#define	BIT_GBE			BIT(16) /* CHT datasheet: reserved */
+#define	BIT_SATA		BIT(17) /* CHT datasheet: reserved */
+#define	BIT_USB_EHCI		BIT(18) /* CHT datasheet: XHCI!    */
+#define	BIT_SEC			BIT(19) /* BYT datasheet: reserved */
 #define	BIT_PCIE_PORT0		BIT(20)
 #define	BIT_PCIE_PORT1		BIT(21)
 #define	BIT_PCIE_PORT2		BIT(22)
-- 
2.43.2


