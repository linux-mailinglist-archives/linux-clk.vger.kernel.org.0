Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6013324359
	for <lists+linux-clk@lfdr.de>; Wed, 24 Feb 2021 18:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbhBXRvN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 24 Feb 2021 12:51:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbhBXRvK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Feb 2021 12:51:10 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7716C06178B
        for <linux-clk@vger.kernel.org>; Wed, 24 Feb 2021 09:50:47 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id w18so1630308plc.12
        for <linux-clk@vger.kernel.org>; Wed, 24 Feb 2021 09:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c7VHaPow7jAC5tq++zBarZr6XHPcoYMOZKoRn160x7Y=;
        b=IXPVbl3iNTTi0tXOgvNRSxmQhtDGZpMcAlY+1RY52aTGCe35jxZOd9LB2LD3td8Vu2
         c3tBE7+9XEbFj3klzAb+Q916xyj8LBE4yJr8Bqni1a6tjszy0Hy9qa4GRGGF/bnHlA0V
         OvTJysQmcB0fUxdI+efGq3K9d27dHIGBBcnGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c7VHaPow7jAC5tq++zBarZr6XHPcoYMOZKoRn160x7Y=;
        b=dfaM4zR2IZJbvppuhXZtjNavTmRr+BF08VT/mFHXZUzaT8gREvluod7Jr1l/D8A+4+
         kSn4WaPcckAy3FSjVQRajzDI8BUIu6itc3k8k0Um7BWp6iCvzKdjCQxR+PVXoVehjb2I
         X7vfCcowXFPAr6qBJwcrewvLvBOPkzIzg1JrXvgnmbJD1ut3PmdlTMgDYYVMSk39d273
         UKamkx5PkTxOqAzubiuP88CHkbZ5qcay8NIWrugxQVfNBFdW6Sz1TXunKkqqzkv+Lqyp
         KMrWxlPqHCj7jjt6dvYaxUNgb7nVFXBYy0MLo2nVl72llpWZRg5Qc9WY1rdFZUj4noSK
         /1Iw==
X-Gm-Message-State: AOAM532y96zAkkmK+rUXgqSQy++XHu10fHGQoecNmmLOT58/O7BAycRB
        rKYixANe+xULpKz/IdvcEZ8nHw==
X-Google-Smtp-Source: ABdhPJzmRNpHGy06ayS0nHQjSssVWG5cAX63IGvZwKqQfT5K7ETFRjjjcgetZLdhp0MdJF3sjdGSqg==
X-Received: by 2002:a17:902:9b93:b029:e0:a40b:cbd7 with SMTP id y19-20020a1709029b93b02900e0a40bcbd7mr8696266plp.16.1614189047337;
        Wed, 24 Feb 2021 09:50:47 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:f92c:e269:f558:e044])
        by smtp.gmail.com with ESMTPSA id x190sm3484032pfx.60.2021.02.24.09.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 09:50:47 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     sboyd@kernel.org
Cc:     vbadigan@codeaurora.org, tdas@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sc7180: Use floor ops for the correct sdcc1 clk
Date:   Wed, 24 Feb 2021 09:50:25 -0800
Message-Id: <20210224095013.1.I2e2ba4978cfca06520dfb5d757768f9c42140f7c@changeid>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While picking commit a8cd989e1a57 ("mmc: sdhci-msm: Warn about
overclocking SD/MMC") back to my tree I was surprised that it was
reporting warnings.  I thought I fixed those!  Looking closer at the
fix, I see that I totally bungled it (or at least I halfway bungled
it).  The SD card clock got fixed (and that was the one I was really
focused on fixing), but I totally adjusted the wrong clock for eMMC.
Sigh.  Let's fix my dumb mistake.

Now both SD and eMMC have floor for the "apps" clock.

This doesn't matter a lot for the final clock rate for HS400 eMMC but
could matter if someone happens to put some slower eMMC on a sc7180.
We also transition through some of these lower rates sometimes and
having them wrong could cause problems during these transitions.
These were the messages I was seeing at boot:
  mmc1: Card appears overclocked; req 52000000 Hz, actual 100000000 Hz
  mmc1: Card appears overclocked; req 52000000 Hz, actual 100000000 Hz
  mmc1: Card appears overclocked; req 104000000 Hz, actual 192000000 Hz

Fixes: 6d37a8d19283 ("clk: qcom: gcc-sc7180: Use floor ops for sdcc clks")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/qcom/gcc-sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index c5c2e93bda8e..5cacd20a31b3 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -620,7 +620,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = 5,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -642,7 +642,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
 		.num_parents = 4,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
-- 
2.30.0.617.g56c4b15f3c-goog

