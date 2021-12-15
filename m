Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAE74761F0
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 20:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhLOTha (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 14:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhLOTha (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 14:37:30 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A59C06173E
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:37:30 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id cf39so33036464lfb.8
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 11:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mrdzZyWE4Zdq5K5t6qtNKYKS+VZ74sSTiXcnXi01NUg=;
        b=tzQLKUQibkpkMLyLWQVGDnwZn+x4dAoyUMyMIMHYqKMG/bu0FlHjksgkCJEDbDSunx
         sjUOo/w/mXW1BMSmZnlE3wpeBz7zjvwwO1ZGlPTwM7D5iYmY5c60tfVYv9XIRmLWmkqw
         fkUvKf+Kgj6brGzybO4GBW9B9aGOKadUDobwZpmdjBh/1XrE4kg+D0kXMuN5FCv/Etoc
         Ajwy5RNKn612f4/2uBIoPwCaWObrZp+Np0Kp85pZeDmMlNe7WtnjlhkViz2S4iYpWLDv
         iLK8xUm93xpZbVOLDZdubycBA4H8pigk4msDgpTt6tiZVpMCgb+NRTFgAdqQn2c1TJwy
         3uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrdzZyWE4Zdq5K5t6qtNKYKS+VZ74sSTiXcnXi01NUg=;
        b=JX5tAsgYvrMizIaH9kn6LeIbpxB3QYtoasiZK5sm/J5nCJDvoKb7B0/fma031sfIOG
         1M+nuAAIK8hWBJsE739w14WKDI2DZIDtWeEyrdJawm5xan//pSCSHzEqZNoaRwpkZtIO
         P0+GVxeDLaFgOor5HHI6Rn4gO0iF6NV4Q28bkZeEt+xbcXYISuPEHikR+ddYKvxxjtw5
         SCMuxMDBZ+K4zrsDwHbmqBgvpJq+WFNmDgnnhwgScRdzEfoPIF9bXJnEYSyHxjdHSH0k
         87Zmj41NEvBOMWPWWYYyJdtT7gpEI67V12IPZR1YRUtF+AG8q1t1IgILvaExb2wtsaeW
         OgGg==
X-Gm-Message-State: AOAM533/3VYVVfrwgb5NCODZrN8VLG0VMXZf2UKrF+zEhfjLFPCW0QIO
        jwYkBqBGjvzct1eyfWt60d6okKQ3vIqUdxWq
X-Google-Smtp-Source: ABdhPJw96cTcEzRqFVn5e+GFzly0/yJ8aKEbetW9MRUjBFbz7cEq+CvCqT+6Y1y1R9WMx/dxnyQf7g==
X-Received: by 2002:a05:6512:249:: with SMTP id b9mr11657164lfo.496.1639597048286;
        Wed, 15 Dec 2021 11:37:28 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 13/16] clk: qcom: gcc-msm8996: drop unsupported clock sources
Date:   Wed, 15 Dec 2021 22:37:01 +0300
Message-Id: <20211215193704.2821775-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation of updating the msm8996 gcc driver, drop all unsupported
GPLL sources (gpll1/gpll1_early_div, gpll2/gpll2_early and gpll3).
Downstream kernel also does not provide support for these GPLL sources,
so it is safe to drop them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 55 ++++------------------------------
 1 file changed, 6 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index d95814025c65..4c85b3935a81 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -27,15 +27,10 @@
 enum {
 	P_XO,
 	P_GPLL0,
-	P_GPLL2,
-	P_GPLL3,
-	P_GPLL1,
-	P_GPLL2_EARLY,
 	P_GPLL0_EARLY_DIV,
 	P_SLEEP_CLK,
 	P_GPLL4,
 	P_AUD_REF_CLK,
-	P_GPLL1_EARLY_DIV
 };
 
 static const struct parent_map gcc_sleep_clk_map[] = {
@@ -130,44 +125,6 @@ static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
 	"gpll0_early_div"
 };
 
-static const struct parent_map gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL1_EARLY_DIV, 3 },
-	{ P_GPLL1, 4 },
-	{ P_GPLL4, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll1_early_div",
-	"gpll1",
-	"gpll4",
-	"gpll0_early_div"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL2, 2 },
-	{ P_GPLL3, 3 },
-	{ P_GPLL1, 4 },
-	{ P_GPLL2_EARLY, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll2",
-	"gpll3",
-	"gpll1",
-	"gpll2_early",
-	"gpll0_early_div"
-};
-
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
@@ -285,12 +242,12 @@ static const struct freq_tbl ftbl_system_noc_clk_src[] = {
 static struct clk_rcg2 system_noc_clk_src = {
 	.cmd_rcgr = 0x0401c,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div_map,
+	.parent_map = gcc_xo_gpll0_gpll0_early_div_map,
 	.freq_tbl = ftbl_system_noc_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div),
+		.parent_names = gcc_xo_gpll0_gpll0_early_div,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1257,12 +1214,12 @@ static const struct freq_tbl ftbl_qspi_ser_clk_src[] = {
 static struct clk_rcg2 qspi_ser_clk_src = {
 	.cmd_rcgr = 0x8b00c,
 	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map,
+	.parent_map = gcc_xo_gpll0_gpll4_gpll0_early_div_map,
 	.freq_tbl = ftbl_qspi_ser_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "qspi_ser_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div),
+		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4_gpll0_early_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

