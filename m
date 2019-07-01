Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C9D416B7
	for <lists+linux-clk@lfdr.de>; Tue, 11 Jun 2019 23:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406997AbfFKVMD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 11 Jun 2019 17:12:03 -0400
Received: from mail-ua1-f74.google.com ([209.85.222.74]:44199 "EHLO
        mail-ua1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406959AbfFKVMD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jun 2019 17:12:03 -0400
Received: by mail-ua1-f74.google.com with SMTP id p13so914829uad.11
        for <linux-clk@vger.kernel.org>; Tue, 11 Jun 2019 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5g9SgyaKPTySWfJg3LNPHAqceK/gsh7xBGRzfCQmGiE=;
        b=lZodZ6j9kTTHdQSxiQl6HxxKgL64WvJ7YvP2tsykPRK/+DVTGrsuRNR3mDWaiyWUbZ
         wn0ex2JyYe3PkQC03U8WnDTH5CQOkG/99uFtB5I6R/ybEZE2RX7hTvk3yaAexFFvTq7Y
         bTrzPcRKMbrpjyU8/cyqeqbyqnSXpgNmTZwyyOjFRswu50VOeFk8T1QRtSTk6gShyYvY
         yyynk+3kGhIOMGVFA+Fdg2f+NvY/5QY5HTgEveuEGdNI1dPFmJEUhDECWrDVvEKHAnEx
         MTZJ4ulo/Yvy9cTMLMgC9FvwQO8KcJR+mJOZ7owzHccNoDT0RM8vgOqwBFcpPz8aTwXH
         losw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5g9SgyaKPTySWfJg3LNPHAqceK/gsh7xBGRzfCQmGiE=;
        b=oOPBGFjMAiJ376vbojZoLqnIn+hLztCrshEjS/QlQHlGOVUJsvnB49ozbsXAGDbGUR
         8CZMb4DyzO20ejILxLO2Jn1jrtdcJzlgE9Iv+SJtK2+asjeQcvfYQI/OlpraQifRtPcQ
         v6q1sXtzB5bu7pJDyYZyLzre9MKlmL9ZWBMCEDgO0aPKsUZe3kfjFxzMj5GwyBWXSQ2Q
         kxQn7mQlGVHrS5QurWuZXMuYUPzyDPeYbAonRNkTWkLR2IHwcIMIsNOG755Afjz8h4Vz
         cFwgDMZIDXsubPzPWRmzcnzTTtQ7/M2Y3Mp9kF14GOkYug2gKgHNXvcAvM43Dj1nllxz
         6e1w==
X-Gm-Message-State: APjAAAXoanulveUGlII96Ns4JgLSY5SVd+OKWFKeS9+Tos70UgcLyWPO
        5m7yKOEg+1VXdBhhPc+cLH9PCr2w2g==
X-Google-Smtp-Source: APXvYqwnBVTE2y+yCuUnSh2UkR+2gJYYnucwu2hfaq7zr1chGY37x8d+vTStgxxXq1D/CHRAzz2qSl0P1g==
X-Received: by 2002:a67:ad07:: with SMTP id t7mr7944256vsl.214.1560287522570;
 Tue, 11 Jun 2019 14:12:02 -0700 (PDT)
Date:   Tue, 11 Jun 2019 14:11:34 -0700
Message-Id: <20190611211134.96159-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH] clk: qcom: Fix -Wunused-const-variable
From:   Nathan Huckleberry <nhuck@google.com>
To:     agross@kernel.org, david.brown@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nathan Huckleberry <nhuck@google.com>,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Clang produces the following warning

drivers/clk/qcom/gcc-msm8996.c:133:32: warning: unused variable
'gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div_map' [-Wunused-const-variable]
static const struct
parent_map gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div_map[] =
{ ^drivers/clk/qcom/gcc-msm8996.c:141:27: warning: unused variable
'gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div' [-Wunused-const-variable] static
const char * const gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div[] = { ^
drivers/clk/qcom/gcc-msm8996.c:187:32: warning: unused variable
'gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div_map'
[-Wunused-const-variable] static const struct parent_map
gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div_map[] = { ^
drivers/clk/qcom/gcc-msm8996.c:197:27: warning: unused variable
'gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div'
[-Wunused-const-variable] static const char * const
gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div[] = {

It looks like these were never used.

Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/518
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/clk/qcom/gcc-msm8996.c | 36 ----------------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index d2f39a972cad..d004cdaa0e39 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -130,22 +130,6 @@ static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
 	"gpll0_early_div"
 };
 
-static const struct parent_map gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL2, 2 },
-	{ P_GPLL3, 3 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll2",
-	"gpll3",
-	"gpll0_early_div"
-};
-
 static const struct parent_map gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 },
@@ -184,26 +168,6 @@ static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early
 	"gpll0_early_div"
 };
 
-static const struct parent_map gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL2, 2 },
-	{ P_GPLL3, 3 },
-	{ P_GPLL1, 4 },
-	{ P_GPLL4, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll4_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll2",
-	"gpll3",
-	"gpll1",
-	"gpll4",
-	"gpll0_early_div"
-};
-
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

