Return-Path: <linux-clk+bounces-87-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC67E71F7
	for <lists+linux-clk@lfdr.de>; Thu,  9 Nov 2023 20:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65FAEB20B9F
	for <lists+linux-clk@lfdr.de>; Thu,  9 Nov 2023 19:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D9F32182;
	Thu,  9 Nov 2023 19:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTo5oK/6"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8094347C9
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 19:09:27 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0BC3C17
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 11:09:27 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ce37683cf6so643148a34.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Nov 2023 11:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699556966; x=1700161766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrQce2fi5joicXGyijMSuzLaWJ9Gi53CJdUsyNCS/ek=;
        b=OTo5oK/6UirVtA1B4jjv9ymP/qPoprM8OKpC4sESNylk8Tmy0h0Qn/gFjKkHJsufed
         cFjKqKBPKV7EMQeP+GF/+ZuDTIwI+I1ozS81KcaAHNjUOFpAFzx+NJc5sw7SZPKucmlj
         7hahqHpyj4YaL5mKsVqk0UPkHN8ESP0n38lvbcUCYzJdYstJIQrh5thyL7Rwm1/SpQ3t
         mGnLbG1CmSeii1UFXhQPjGfP3p3xShewDg+4yoYjhxYTTEDqu4R6W5Kq14I19X1/JktO
         5VdGtMN7BPusmTQKbjBU2UsTVqY9b07iHKteQ7pUzV2cNgrwNqmVd0iNOx6VHsI6lL60
         +MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556966; x=1700161766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrQce2fi5joicXGyijMSuzLaWJ9Gi53CJdUsyNCS/ek=;
        b=ijv7hRCTS5FzAccG7i9xrogXONWHMahUwzSChzDJg9j5BjT+jK6CKexVX/JAt37QT7
         ym3GR7k4MywkkddYyTbAqaWilp/n7uHEjdY+Z6w/CCCSDiNDAV9TFb9LwpU+SS4U0L7M
         /cqp8aaN/8etvfKLFEuQlsoBSyD4LyZnWWI+273V2U/2mURyhEGKSui43Aw//YrLKPFZ
         4ZBVxu7//Ecq+ngc26lmTKc+j4q6IzIutHx1NJmFSVdZBuWILaIUSVY8aRK0gRWKIGaV
         yDwPwzH1fMASqffSq7t5J+YUsRpEkPD7h4bFO7lloLVVOTwp7WXGL3G8/0L375ZHYLiK
         dASw==
X-Gm-Message-State: AOJu0YzQkzg9oR3VgbVw57LAPmIcA8IOh+VoJX26wzubzVVCTXSMQ0H5
	NzaiqoRgNh9fbCt6mVF/Fw+Uew==
X-Google-Smtp-Source: AGHT+IEqhChy+9PfaLLygYaRjg10mzOliTG5x8L2DEzLyUa75MzGgjDixLGrR6Dvtd6wNHIA3mif1Q==
X-Received: by 2002:a05:6830:e08:b0:6b8:7880:de9 with SMTP id do8-20020a0568300e0800b006b878800de9mr6195268otb.19.1699556966399;
        Thu, 09 Nov 2023 11:09:26 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id a23-20020a056830009700b006b9443ce478sm2300447oto.27.2023.11.09.11.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 11:09:26 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: samsung: Fix kernel-doc comments
Date: Thu,  9 Nov 2023 13:09:24 -0600
Message-Id: <20231109190925.2066-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some issues found in kernel-doc comments in Samsung CCF framework.
It makes scripts/kernel-doc happy, which can be checked with:

    $ find drivers/clk/samsung/ -name '*.[ch]' -exec \
      scripts/kernel-doc -v -none {} \;

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Fixes: ddeac8d968d4 ("clk: samsung: add infrastructure to register cpu clocks")
Fixes: 721c42a351b1 ("clk: samsung: add common clock framework helper functions for Samsung platforms")
Fixes: 3ff6e0d8d64d ("clk: samsung: Add support to register rate_table for samsung plls")
---
 drivers/clk/samsung/clk-cpu.h | 2 +-
 drivers/clk/samsung/clk.h     | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index fc9f67a3b22e..103f64193e42 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -11,7 +11,7 @@
 #include "clk.h"
 
 /**
- * struct exynos_cpuclk_data: config data to setup cpu clocks.
+ * struct exynos_cpuclk_cfg_data: config data to setup cpu clocks.
  * @prate: frequency of the primary parent clock (in KHz).
  * @div0: value to be programmed in the div_cpu0 register.
  * @div1: value to be programmed in the div_cpu1 register.
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index ab9c3d7a25b3..4f17d5890a81 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -55,7 +55,7 @@ struct samsung_clock_alias {
  * @name: name of this fixed-rate clock.
  * @parent_name: optional parent clock name.
  * @flags: optional fixed-rate clock flags.
- * @fixed-rate: fixed clock rate of this clock.
+ * @fixed_rate: fixed clock rate of this clock.
  */
 struct samsung_fixed_rate_clock {
 	unsigned int		id;
@@ -74,7 +74,7 @@ struct samsung_fixed_rate_clock {
 		.fixed_rate	= frate,		\
 	}
 
-/*
+/**
  * struct samsung_fixed_factor_clock: information about fixed-factor clock
  * @id: platform specific id of the clock.
  * @name: name of this fixed-factor clock.
@@ -146,14 +146,16 @@ struct samsung_mux_clock {
 	__MUX(_id, cname, pnames, o, s, w, f, mf)
 
 /**
- * @id: platform specific id of the clock.
  * struct samsung_div_clock: information about div clock
+ * @id: platform specific id of the clock.
  * @name: name of this div clock.
  * @parent_name: name of the parent clock.
  * @flags: optional flags for basic clock.
  * @offset: offset of the register for configuring the div.
  * @shift: starting bit location of the div control bit-field in @reg.
+ * @width: width of the bitfield.
  * @div_flags: flags for div-type clock.
+ * @table: array of divider/value pairs ending with a div set to 0.
  */
 struct samsung_div_clock {
 	unsigned int		id;
@@ -244,6 +246,7 @@ struct samsung_clk_reg_dump {
  * @con_offset: offset of the register for configuring the PLL.
  * @lock_offset: offset of the register for locking the PLL.
  * @type: Type of PLL to be registered.
+ * @rate_table: array of PLL settings for possible PLL rates.
  */
 struct samsung_pll_clock {
 	unsigned int		id;
-- 
2.39.2


