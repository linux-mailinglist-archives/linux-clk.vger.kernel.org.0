Return-Path: <linux-clk+bounces-10543-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258294BFD5
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 16:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F334B23E13
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2024 14:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE45718F2C9;
	Thu,  8 Aug 2024 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkPYFyEC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCBC18EFD6
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128172; cv=none; b=RfO3uezyQv8tySPEogHDwie37oCb3arwfi8zg2vNav3lAYcv+erHTKD1vknpjQyozOy8f5GhQ6OUgCRyRK+Z66obd+WJixH+4LvkqG1wLQ+rp1nhVQzoJ+TtdeftobQrVy20aIJgug+JWWd17VdSM+vtX4V+gQNN+H2WQBj2O1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128172; c=relaxed/simple;
	bh=phSh2XvCFEiUMauve2onB18CfRqYBSjgZvD5K1lRvxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhgRVDLquW5vw/cVhrcJT9fpeNJ1xq2YM/UuI+2/aroEm3lDTgq+IcRMpwXmUF2N/GDXW6y/0St5QtnbsHaNSrU3syD3fxTEbSNaF+FShwY5jSNUagqky6i+QFOjnefBhpt4ZphFFyUN8PpmhaoXw/Lsap0uQSepVAn7a36PCV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xkPYFyEC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so2222855e87.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128169; x=1723732969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6h/PuTPKH5TJqQzR5VNqTicpqs9HJAf+NVaf1wSFmws=;
        b=xkPYFyECWkPw+4SgGhhUGFYWWDHtFeWZMy6Ov+fJ42J9kst3SVa8XEwX/fsMzb7Ogd
         Ba9EJGiQJ+wMrg9QCXNmLSnfkOP9aHheSt/sj4thaGyPomYEb6q/Lh41HTq8iDJA15Kt
         a5S/1cuYE26eNSl12nU8WoDDcgl/oCSqWMsNqyEuRxkqfaBPeTX/5dffy1k3XZMhCk5Y
         MTCv8CP/goP4inDIrY7X2ZSee2X6FKLjJHRwWq7jRTPCRalgVocAzXOfUVUWNT+f7o6g
         9bSHj+WrnZ0Utlp080l/rGGT4Ad7nwjQ44Ce40TqHXwIjsdD1/I5p8nj1TTOJs4nuYf+
         G26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128169; x=1723732969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h/PuTPKH5TJqQzR5VNqTicpqs9HJAf+NVaf1wSFmws=;
        b=axY+GVO498o4EhnkhEwFnxObb3PSeTKB7SXVhXh2XvDUU78tjh8Dkl97FN3CvWaRAi
         guCmSDL2+gppUQIg3JgSpzPE6HZY5J2ttYa/QlNVERWEaqnvItianeJmImes1OlEGbR5
         hZIaAoe8jWvyU6rQv9X6x65rcaXK1JiZfy0B+aVAry+0wzkS5w1+wfGq/4dlBOnL2j60
         7cUEjgaVYIFN2DiWXTKf7DnX+mj2CAXxhnkL6sb1k8h6Lr4aOh//0DiALNyFQ5sRAS2e
         ytl3tKqVFGgJqCPaAt0V2Nh4NSa5do9sh+aT1eM+yXIZPqkoBJ5nw0bZ04Z5WecrKItx
         Mzbg==
X-Forwarded-Encrypted: i=1; AJvYcCW4MboIFUi4jg0h0l9ePw6nGfECnNpCtVlmzUuBSubZmZFzNKkLsNbJpbkWx9k9XxlPwVkR3IZYgiqd72sP2Mezy/Ghu3K3Dzi5
X-Gm-Message-State: AOJu0YwIrJc9D7frFoZYUTFjLA1snMu8YdPVSVyYwgz6TD+QWksXZOWe
	AB8ynL8/bdTPp+QafgMYoru/krNAGk/PZwr6gvsX+4r9DcaEHIQkgi6YXFCndRk=
X-Google-Smtp-Source: AGHT+IFDwoj0nnETAp5ptJMjL4P7urk3RcUJ04ImSOzddUGvLFkGFWs9zoWB3if6J8Ft2xrAtWRU1g==
X-Received: by 2002:a05:6512:1107:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-530e589929fmr1546854e87.60.1723128168690;
        Thu, 08 Aug 2024 07:42:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:43 +0100
Subject: [PATCH v6 02/20] clk: samsung: gs101: don't mark non-essential
 (UART) clocks critical
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-2-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The peric0_top1_ipclk_0 and peric0_top1_pclk_0 are the clocks going to
peric0/uart_usi, with pclk being the bus clock. Without pclk running,
any bus access will hang.
Unfortunately, in commit d97b6c902a40 ("arm64: dts: exynos: gs101:
update USI UART to use peric0 clocks") the gs101 DT ended up specifying
an incorrect pclk in the respective node and instead the two clocks
here were marked as critical.

As a side-effect and by accident, having them 'critical' also
worked-around a problem where earlycon stops to work sometime into the
boot for two reasons:
    * peric0_top1_ipclk_0 requires its parent gout_cmu_peric0_ip to be
      running, but because earlycon doesn't deal with clocks that
      parent will be disabled when none of the other drivers that
      actually deal with clocks correctly require it to be running and
      the real serial driver (which does deal with clocks) hasn't taken
      over yet
    * hand-over between earlycon and serial driver appears to be
      fragile and clocks get enabled and disabled a few times, which
      also causes register access to hang while earlycon is still
      active
(A wordier explanation can also be found in [1])

Since then, the DT has been updated to use the correct clock in
commit 21e4e8807bfc ("arm64: dts: exynos: gs101: use correct clocks for
usi_uart"). Furthermore, the clk core now helps OF platforms with their
stdout (earlycon) clocks during early boot and thereby avoids the
problem described above.

The driver here can now be corrected and the work-arounds removed. Do
so.

Link: https://lore.kernel.org/all/d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org/ [1]
Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

---
v5: update commit message

v4:
- the earlycon issue described in the commit message in previous
  versions of this patch is gone with "clk: samsung: gs101: allow
  earlycon to work unconditionally", so no need to mention anything

v3:
- add git commit SHA1s (Krzysztof)
- add link to wordier description of earlycon issue

v2:
- commit message typo fixed
- collect Reviewed-by: tags
---
 drivers/clk/samsung/clk-gs101.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 85098c61c15e..9769c00b6ca8 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -3946,20 +3946,18 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     "gout_peric0_peric0_top0_pclk_9", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
 	     21, 0, 0),
-	/* Disabling this clock makes the system hang. Mark the clock as critical. */
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0,
 	     "gout_peric0_peric0_top1_ipclk_0", "dout_peric0_usi0_uart",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2,
 	     "gout_peric0_peric0_top1_ipclk_2", "dout_peric0_usi14_usi",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2,
 	     21, CLK_SET_RATE_PARENT, 0),
-	/* Disabling this clock makes the system hang. Mark the clock as critical. */
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0,
 	     "gout_peric0_peric0_top1_pclk_0", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
-	     21, CLK_IS_CRITICAL, 0),
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2,
 	     "gout_peric0_peric0_top1_pclk_2", "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2,

-- 
2.46.0.rc2.264.g509ed76dc8-goog


