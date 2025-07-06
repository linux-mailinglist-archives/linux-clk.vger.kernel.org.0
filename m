Return-Path: <linux-clk+bounces-24007-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2109BAF5D1D
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 17:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C941177486
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 15:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6E330113F;
	Wed,  2 Jul 2025 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qtiDelh9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E5A2FF464
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470064; cv=none; b=mGo17lblXowEoDkrmzAUnp37hAPiRACq04pjP9BhbCUvbCTprd8T4QllLBWWV+wJl2AzFwXnLKb4bKbdrsK+p7kuEP3nksQkzcW3L8Y4HMSC+ari6MmIJK+JBJ+NzieYTUGTB4kTI3QwJDavX6Sou3DBewy92zKPXPDpClz+1kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470064; c=relaxed/simple;
	bh=suncESI2oSW1jGwgW8HALT/gxYfqW5NYgFG0TK2ZRwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8YkgdAKwrVsLs/vJp7vUgPO/A/Gwq9LM7V48dDYEbDkmztWQndQ0Xautbm4PGEkMGc99HkSNdCBQyGtZ/32xiXCzX0YkAwz9Ns45Lt14LDt+7YkY4oBTV663Rea7cEXUdR9ulD8nNx1EgNsOglxy320zVOHv9XtGB5MOWSe79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qtiDelh9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45363645a8eso49320725e9.1
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470057; x=1752074857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=qtiDelh9NqjTxxHlWzrALoK8J83EEzK+Ir2/uS/s7YpW3zXg9XQe1j7W25/ZOk7G6v
         dmCDX70omxww/5fI6AdSGZIetp4+I9Kgwn/Re+bN5qOEuWgSJ3gdvYdD9oE6/xPnzU4f
         aebNl2ux7rE/cX5KeNkmNActMlQMuo2kWHAR6pAu7mfEKGlk2ApnycYJxPuTfl3nrx8z
         oK+xuNaBfvSh3o18XOKpAOUj82OZMzU+Rd9dfGNcq6dfykj5B+SLz2pfz3DfDl6g60PF
         YKPjLb2qSPQd/JHsNH7fu5jCE6ps3XhYBdvnF90nW4mxLPP61W2J1IVDz5rObSAouEm/
         a1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470057; x=1752074857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=BKr/2RulFglsRsGgX6z172jkS8o85ImenNMC3hCqHBr1F1D/DxFVSGEGuxT1BZHa13
         vdaGwH+O5AYVoTEz051TBKkYWbA4IbBDmu/3ShrspMPmz7tAzug7RhoYVP5OSF9HLCuf
         3fegbMVGnYThJIxpiKE9B+NoWz/QFYbNqloWtRvU+fa0ESe4PaaLZTEfh8CjhtIVOBzB
         ICJlEJsS7JUN8FZdrzRwXBYdANfvLByuC3Hk2VuMxDxZMvpCthqfcOOhNWQkvHMO9gHr
         +nhvR8wU8t0fxmDZ403FaclwO/cTioC4tyGN54gqBr65nMkmyexPObFITk7LON05z0uy
         eBqw==
X-Forwarded-Encrypted: i=1; AJvYcCUc3xKGd9LlEaeNiSWznKq7wxNLQgg3ormGXpN371laI9O7gqPK6WDCRCEpxmB98UzbqvobGkWamFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHSU+9SSUT/HR3NwWzHLYy0WZRXfUMCcUp8KrHutSvglOmdkV
	fmRYlEJhupx4USweSz0QTLp9GvO1fUp47josw5cFSqoTajtouiv9yubhTw0klQV73Qc=
X-Gm-Gg: ASbGnct4OIE25nOk+4Y48VBgRkptDiYypPwaY+H02qgj/Wq5E1Cid6OViQF8+5T3/PH
	uZqazytgOhB4BemHabPpGYVJFg177qijheiyc1/IxjhCR6lmYXq+1M4Sy/49MWBtUz3Sk8mMIBp
	UiXbZUGy1wjK940UmW1WIjkxKVcOHzMsHLHrs5cPXEt8VxAX4CnSuscI0MmbA+WvBnP7KNzO9Ja
	ffeG1EANNRCMEv6GzGQZ0+QMP8KNgj5IJGZ5sA4TvbCXl4kgaBFV3YzTvn6IGiVJ5GVRCtOqDOf
	LKTjik9SsUwbwEGmGXXIBEXY/hQo9XAQZ/BujPucEGEpHlEruC2YJKquHBjpuxUGLUKnnccBzdG
	2
X-Google-Smtp-Source: AGHT+IG5Nvg+4XJUXbEmvNpTdwBa6VKhe/U9qpL2tS5X8/kLxbQUPadTzNBqGqY2Pp9MJ0NtvGPYvQ==
X-Received: by 2002:a05:600c:c4a5:b0:453:6150:de50 with SMTP id 5b1f17b1804b1-454a9cd94e6mr346715e9.28.1751470057461;
        Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:22 +0200
Subject: [PATCH 24/26] clk: amlogic: add composite clock helpers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-24-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=suncESI2oSW1jGwgW8HALT/gxYfqW5NYgFG0TK2ZRwc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/M8MpgauqMch296c/UgbjKdCbz6RmqaG7+f
 uOBnQ9nC0yJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPzAAKCRDm/A8cN/La
 hWnsEACSnG22dz/mQvVC16u619+gXbE7D/A+OD2TuY4CL7XBrH7HphO3oVze0AeyGJ9+rVtJiVX
 ssivYxqO2B7DNqkWcJovuYcX8hyDwe8UYGhQQeD5mVekxQZR7I4wRvydAqCm1BSxYzP8P3vjCk+
 lBF95dmWTj0knQsem7xahxacMQMvGJDZFQ2LgXv1pz4Q4S+8H4xkSJYRIbtugP3eHNID+Y2amyi
 XvNA04JFI0bOG0FkToEcxsLHHn99qTf7Dle566H2NHgOneBNZWVCvCaaYAW0lIRn7ZoFYN1R7qs
 3UEQL9IoK2qtEGynnokTneFzeD6z8U/KcJBk48osJBcAT+asMQQmREI0bYt/jq3DcNQY1Cm2cHT
 /T9DItBlCT3FVsTMib1JVK7RgHRvg8tZInVzXQoY2yCWM2s6i+KvFDT6doqHLuyh9Hr3Gj/6CjP
 waFGuO6dxHv5dB3vEtKtiQ5tyKkagvQ6c3ha900qhiGD/Kle2ZWK52DDairL3wXJb6d0+phn1Uf
 7T4l8gXupb1X08JGdOrqZ1xYjV9uKUNECM9K4TYjF7yn7QD24AjllGAPIx5eTECYmEzTHZG8zEE
 1YPty6nC3eOBIsatncgY27yluN5J+LVZprK7yvi40UNAtlMSsYrTkkr8cWVKD6a9SI6IqSMVwEA
 HZkuxOWcI66bCVw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Device composite clocks tend to reproduce the usual sel/div/gate
arrangement.

Add macros to help define simple composite clocks in the system.

The idea is _not_ to replace all instances of mux, div or gate with those
macros. It is rather to use it for recurring and/or simple composite
clocks, reducing controller verbosity where it makes sense. This should
help reviews focus on the tricky parts.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.h | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8..ddadf14b4923781d8807546f35a1ba2e6a8a894a 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -48,4 +48,61 @@ struct clk_regmap _name = {						\
 #define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)		\
 	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
 
+/* Helpers for the usual sel/div/gate composite clocks */
+#define MESON_COMP_SEL(_prefix, _name, _reg, _shift, _mask, _pdata,	\
+		       _table, _dflags, _iflags)			\
+struct clk_regmap _prefix##_name##_sel = {				\
+	.data = &(struct clk_regmap_mux_data) {				\
+		.offset = (_reg),					\
+		.mask = (_mask),					\
+		.shift = (_shift),					\
+		.flags = (_dflags),					\
+		.table = (_table),					\
+	},								\
+	.hw.init = &(struct clk_init_data){				\
+		.name = #_name "_sel",					\
+		.ops = &clk_regmap_mux_ops,				\
+		.parent_data = _pdata,					\
+		.num_parents = ARRAY_SIZE(_pdata),			\
+		.flags = (_iflags),					\
+	},								\
+}
+
+#define MESON_COMP_DIV(_prefix, _name, _reg, _shift, _width,		\
+		       _dflags, _iflags)				\
+struct clk_regmap _prefix##_name##_div = {				\
+	.data = &(struct clk_regmap_div_data) {				\
+		.offset = (_reg),					\
+		.shift = (_shift),					\
+		.width = (_width),					\
+		.flags = (_dflags),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name "_div",					\
+		.ops = &clk_regmap_divider_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&_prefix##_name##_sel.hw			\
+		},							\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
+#define MESON_COMP_GATE(_prefix, _name, _reg, _bit, _iflags)		\
+struct clk_regmap _prefix##_name = {					\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &clk_regmap_gate_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&_prefix##_name##_div.hw			\
+		},							\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
 #endif

-- 
2.47.2


