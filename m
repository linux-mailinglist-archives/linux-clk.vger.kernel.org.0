Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C6850E818
	for <lists+linux-clk@lfdr.de>; Mon, 25 Apr 2022 20:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244331AbiDYS0O (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 Apr 2022 14:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244361AbiDYS0N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 14:26:13 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34519112D86;
        Mon, 25 Apr 2022 11:23:05 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g20so19487696edw.6;
        Mon, 25 Apr 2022 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skFtK8ncz5bLZC06oqy32h7OgmhSsmfTgt/itwzobJE=;
        b=dwRQLvdu6XNrpRRZMbEGioslLD2l3FZDjYQUVE6jvecnieVuQ/DBGDTQ1mnBuAkmCX
         ci1z0BpH9hSRLYWoLG6OxQGaJWx6Aj5OcezkTVpR/kAEWtx9OSgpvOl/iZ6B7MZb9pWz
         EDVp1s1DbbZnAUVGS/hNccs3xUjeXOOZKPBZ4v1kkxCUB52HGNid31eyeHq1DSBKdL11
         N38m3Frn0OJTMsp6LTxjt+yFmiHfKRaPTAKOTnzki1To8McjxmI3AvDGslKJLunuBCDY
         09G/a7YBiNE6f/seRgVhIRKiMWKr1XLLrPpL0T31bs7WeRzUuqafnyC4Z12N7nWgZle6
         /tAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skFtK8ncz5bLZC06oqy32h7OgmhSsmfTgt/itwzobJE=;
        b=2S9kYFK0rLBQtkKpt+FnGeIdWl+NFykSPHY27MPPtYF6fhBTf6Ztl8b3bguEXF7pEW
         euX9POwk6eqmMy8g2LLFMMjStPkexbH+99858uovtOgkLWCjnERVaXW4PBJHOUDfKcPc
         kaEP5OOI2IwCqkmxNY9GCZa3bsDTkqMhGcnoswJXnEK5ZyIYLbACWX00pOw/s73s96TZ
         RiQJsOIS6YsYUOGe73tkCdm/ysvnImxTSM3L3Jz6a53NFj4y9MQwwWcjwKeyq2vPTLBE
         XuaPPnaWHuTqMvnI9dpHXvMneVyuxc/T4zlWwi+r+md6+vMd0djsB4UoRXe7I9TF7lSM
         fWsw==
X-Gm-Message-State: AOAM530LF+jmFHsgHcIT5lbjnjYZc8O8WMIGgCOyMPlUk8psUZV1CfWe
        F2xq6a6Tm+vxMJtg/RqnGSg=
X-Google-Smtp-Source: ABdhPJxaljTXaNgBN3bYcRjbPSiSTMx4+U+v5Egsu66uRc/+ybXlZidl56pqtndCU45GhBwlMyXlrw==
X-Received: by 2002:a05:6402:3593:b0:425:dfd4:2947 with SMTP id y19-20020a056402359300b00425dfd42947mr9098632edc.137.1650910983810;
        Mon, 25 Apr 2022 11:23:03 -0700 (PDT)
Received: from fedora.robimarko.hr (cpe-94-253-165-91.zg.cable.xnet.hr. [94.253.165.91])
        by smtp.googlemail.com with ESMTPSA id h13-20020a170906590d00b006f39021e683sm1677210ejq.12.2022.04.25.11.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 11:23:03 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH 7/7] clk: qcom: ipq8074: set BRANCH_HALT_DELAY flag for UBI clocks
Date:   Mon, 25 Apr 2022 20:22:49 +0200
Message-Id: <20220425182249.2753690-7-robimarko@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425182249.2753690-1-robimarko@gmail.com>
References: <20220425182249.2753690-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently, attempting to enable the UBI clocks will cause the stuck at
off warning to be printed and clk_enable will fail.

[   14.936694] gcc_ubi1_ahb_clk status stuck at 'off'

Downstream 5.4 QCA kernel has fixed this by seting the BRANCH_HALT_DELAY
flag on UBI clocks, so lets do the same.

Fixes: 5736294aef83 ("clk: qcom: ipq8074: add NSS clocks")
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/clk/qcom/gcc-ipq8074.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index e6625b9fab35..54f292ab1f0d 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -3372,6 +3372,7 @@ static struct clk_branch gcc_nssnoc_ubi1_ahb_clk = {
 
 static struct clk_branch gcc_ubi0_ahb_clk = {
 	.halt_reg = 0x6820c,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x6820c,
 		.enable_mask = BIT(0),
@@ -3389,6 +3390,7 @@ static struct clk_branch gcc_ubi0_ahb_clk = {
 
 static struct clk_branch gcc_ubi0_axi_clk = {
 	.halt_reg = 0x68200,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x68200,
 		.enable_mask = BIT(0),
@@ -3406,6 +3408,7 @@ static struct clk_branch gcc_ubi0_axi_clk = {
 
 static struct clk_branch gcc_ubi0_nc_axi_clk = {
 	.halt_reg = 0x68204,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x68204,
 		.enable_mask = BIT(0),
@@ -3423,6 +3426,7 @@ static struct clk_branch gcc_ubi0_nc_axi_clk = {
 
 static struct clk_branch gcc_ubi0_core_clk = {
 	.halt_reg = 0x68210,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x68210,
 		.enable_mask = BIT(0),
@@ -3440,6 +3444,7 @@ static struct clk_branch gcc_ubi0_core_clk = {
 
 static struct clk_branch gcc_ubi0_mpt_clk = {
 	.halt_reg = 0x68208,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x68208,
 		.enable_mask = BIT(0),
@@ -3457,6 +3462,7 @@ static struct clk_branch gcc_ubi0_mpt_clk = {
 
 static struct clk_branch gcc_ubi1_ahb_clk = {
 	.halt_reg = 0x6822c,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x6822c,
 		.enable_mask = BIT(0),
@@ -3474,6 +3480,7 @@ static struct clk_branch gcc_ubi1_ahb_clk = {
 
 static struct clk_branch gcc_ubi1_axi_clk = {
 	.halt_reg = 0x68220,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x68220,
 		.enable_mask = BIT(0),
@@ -3491,6 +3498,7 @@ static struct clk_branch gcc_ubi1_axi_clk = {
 
 static struct clk_branch gcc_ubi1_nc_axi_clk = {
 	.halt_reg = 0x68224,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x68224,
 		.enable_mask = BIT(0),
@@ -3508,6 +3516,7 @@ static struct clk_branch gcc_ubi1_nc_axi_clk = {
 
 static struct clk_branch gcc_ubi1_core_clk = {
 	.halt_reg = 0x68230,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x68230,
 		.enable_mask = BIT(0),
@@ -3525,6 +3534,7 @@ static struct clk_branch gcc_ubi1_core_clk = {
 
 static struct clk_branch gcc_ubi1_mpt_clk = {
 	.halt_reg = 0x68228,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x68228,
 		.enable_mask = BIT(0),
-- 
2.35.1

