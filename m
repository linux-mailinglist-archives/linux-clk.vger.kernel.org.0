Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3315521A179
	for <lists+linux-clk@lfdr.de>; Thu,  9 Jul 2020 15:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgGINzZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 9 Jul 2020 09:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgGINy3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jul 2020 09:54:29 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488ADC08C5DC
        for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2020 06:54:29 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id e11so1820366qkm.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2020 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fem3XNP+K3JU9MCaDCRGbzpn3Qjj+S6fTPpAXuau47M=;
        b=hAlmvW4o0211WIkXXm367d35CQ7rpJVjGeq++KBuyW55ksPCAQvWh6GvftNsbtOIto
         WZbou0aBqticgRYabx69LqCwcKzOcgPFLap1cquZeQ9gIvj2YmZPq7Hdmi7yKqSJf2OF
         GNJMKTySv6UpBxespWjsQScZ5OHHNam4iEznA7ShGp/ocxUYx3N0UD8ESohbHdsc4MZm
         1t/1m0LjYxov4ZCvs+/zELjbCI+fRbzh/PmnQRF0akLcojnXjBfYyKsXQO2dfa7oAlAg
         rh0/8Z9xDCPecpIXTly5w59yzXqHgWe02I/InloQE2q7D8cAcPBnE2b7/LA1oXQoKOQk
         BSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fem3XNP+K3JU9MCaDCRGbzpn3Qjj+S6fTPpAXuau47M=;
        b=V/cZO713mxeib/IQsUgcXo7J+eI94cqFsCWbUjcgVXJdv1NcZtRwTrlE99Xwmsy8YT
         ADdsogL8HU4uazk176y2T9qIVhXqwNsyPGP7/phTpEvrVAeab1W6e81+fPHhqwXR9ydx
         f47ozdD9YSRvoTPqqlmtCudlOmtFh7+GW7Aw9Q7t3vzizUgoEM561QHm8zxX4j0vODl1
         SxY4hiLv0mmJ/cZotiBtgA+rUVtvmdaB/GEqOFoptJVzjc2wt5Sxj2vz1ko5x6Ypz3yf
         cLBn0/nP9GJlaERPdHGD50dv7t8ECDOhflgdFHfp2DTs+Z53QNHVw2ykiJx9pmb84gVK
         NeEQ==
X-Gm-Message-State: AOAM531ybRSGFPpF4BdJbzIN9c2C5LbudWFOcnrgBALkHCGM1l8kqwtb
        xbU8nou21F8GeeTXKnZPkeHkbg==
X-Google-Smtp-Source: ABdhPJyJdQD7Y//ni5Cpi89QK1ui6/OHs1bXVF3ku1gRzT0FvAuGPVSylwCSuYjEhRLJ629bU5KhIA==
X-Received: by 2002:a05:620a:22cc:: with SMTP id o12mr48552285qki.230.1594302868575;
        Thu, 09 Jul 2020 06:54:28 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 130sm3632735qkn.82.2020.07.09.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 06:54:28 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 02/14] clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
Date:   Thu,  9 Jul 2020 09:52:33 -0400
Message-Id: <20200709135251.643-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200709135251.643-1-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.

Fixes: 548a909597d5 ("clk: qcom: clk-alpha-pll: Add support for Trion PLLs")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 9b2dfa08acb2..1325139173c9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -56,7 +56,6 @@
 #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
 #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
 #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
-#define PLL_CAL_VAL(p)		((p)->offset + (p)->regs[PLL_OFF_CAL_VAL])
 
 const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
@@ -115,7 +114,6 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_STATUS] = 0x30,
 		[PLL_OFF_OPMODE] = 0x38,
 		[PLL_OFF_ALPHA_VAL] = 0x40,
-		[PLL_OFF_CAL_VAL] = 0x44,
 	},
 	[CLK_ALPHA_PLL_TYPE_LUCID] =  {
 		[PLL_OFF_L_VAL] = 0x04,
-- 
2.26.1

