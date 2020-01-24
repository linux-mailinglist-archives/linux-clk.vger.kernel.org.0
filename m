Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC36E149144
	for <lists+linux-clk@lfdr.de>; Fri, 24 Jan 2020 23:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387405AbgAXWoA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Jan 2020 17:44:00 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38725 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729213AbgAXWnR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jan 2020 17:43:17 -0500
Received: by mail-pf1-f194.google.com with SMTP id x185so1797253pfc.5
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2020 14:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aUtLqcv/Vq5O1yPHr9lwO+Q2UaRXNLbVqC9iz4yzAPg=;
        b=cL6KsxWn65i8MFgUEzTp+bXeafZ/i2X7w0dWVLte1h4a9phyM7AkaNYA76gqLq3hdV
         sfTSY+rfJud6zwRGnrv6x3KeCEgrwx4OFCja6jk6Z3YhXkdDRd0ZCzFzBL61D8l8r4GI
         L2yxfewfPBbhLFhiBN7XwL6Bp+fSwrYzQTqIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aUtLqcv/Vq5O1yPHr9lwO+Q2UaRXNLbVqC9iz4yzAPg=;
        b=aaa83Nff8bZCl5Mvqlpqa/saIh+BEWYHjABZ55CdRnLm6U4WMbSC1iZLzRzCjBHgs+
         SLhz9yj6Uv7fDvq5yQI63qED4cyzxne9gtE1w187rbkUWj5ooXAfcHxXt0Fq1X0Gf/pV
         odRkkBOSVkWwf+Fm1W4Iw6WEG3ie0//ikVmUzLyotstJKVqfOsyzlPu9DX5zhtgpuRgX
         CL6oZ1U8OuxGLvs5M/zFefeTfzua2r+ehgB19AhgNd+xo+C4YiFXCHHpc+IqU7k+hvXz
         cNi8HAuy2EXwlulRtOxSSMSGfLFxTCwiRePdocELgD71kk66MfvEV4pZflg5HEiIVbpL
         vKVg==
X-Gm-Message-State: APjAAAXtLT9dPBXrryOn+uJPRtUdu63oLTTqHsCQIWyi72sxy/Ffs0iU
        BsrceIDJDMHzAcNM7o5EebmqPA==
X-Google-Smtp-Source: APXvYqz/yZrIXvlaesHWaGFX+hjcycDFPTVmoM0llXD8iTg1khhXkmxb5j/IXoOJGvU5uVMlzcYJSg==
X-Received: by 2002:a63:e954:: with SMTP id q20mr6967695pgj.204.1579905796900;
        Fri, 24 Jan 2020 14:43:16 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:16 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] clk: qcom: rcg2: Don't crash if our parent can't be found; return an error
Date:   Fri, 24 Jan 2020 14:42:16 -0800
Message-Id: <20200124144154.v2.1.I7487325fe8e701a68a07d3be8a6a4b571eca9cfa@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When I got my clock parenting slightly wrong I ended up with a crash
that looked like this:

  Unable to handle kernel NULL pointer dereference at virtual
  address 0000000000000000
  ...
  pc : clk_hw_get_rate+0x14/0x44
  ...
  Call trace:
   clk_hw_get_rate+0x14/0x44
   _freq_tbl_determine_rate+0x94/0xfc
   clk_rcg2_determine_rate+0x2c/0x38
   clk_core_determine_round_nolock+0x4c/0x88
   clk_core_round_rate_nolock+0x6c/0xa8
   clk_core_round_rate_nolock+0x9c/0xa8
   clk_core_set_rate_nolock+0x70/0x180
   clk_set_rate+0x3c/0x6c
   of_clk_set_defaults+0x254/0x360
   platform_drv_probe+0x28/0xb0
   really_probe+0x120/0x2dc
   driver_probe_device+0x64/0xfc
   device_driver_attach+0x4c/0x6c
   __driver_attach+0xac/0xc0
   bus_for_each_dev+0x84/0xcc
   driver_attach+0x2c/0x38
   bus_add_driver+0xfc/0x1d0
   driver_register+0x64/0xf8
   __platform_driver_register+0x4c/0x58
   msm_drm_register+0x5c/0x60
   ...

It turned out that clk_hw_get_parent_by_index() was returning NULL and
we weren't checking.  Let's check it so that we don't crash.

Fixes: ac269395cdd8 ("clk: qcom: Convert to clk_hw based provider APIs")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I haven't gone back and tried to reproduce this same crash on older
kernels, but I'll put the blame on commit ac269395cdd8 ("clk: qcom:
Convert to clk_hw based provider APIs").  Before that if we got a NULL
parent back it was fine and dandy since a NULL "struct clk" is valid
to use but a NULL "struct clk_hw" is not.

Changes in v2:
- Patch ("clk: qcom: rcg2: Don't crash...") new for v2.

 drivers/clk/qcom/clk-rcg2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index da045b200def..9098001ac805 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -218,6 +218,9 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 
 	clk_flags = clk_hw_get_flags(hw);
 	p = clk_hw_get_parent_by_index(hw, index);
+	if (!p)
+		return -EINVAL;
+
 	if (clk_flags & CLK_SET_RATE_PARENT) {
 		rate = f->freq;
 		if (f->pre_div) {
-- 
2.25.0.341.g760bfbb309-goog

