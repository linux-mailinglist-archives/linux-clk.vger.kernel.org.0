Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07564CB980
	for <lists+linux-clk@lfdr.de>; Thu,  3 Mar 2022 09:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbiCCIts (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Mar 2022 03:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiCCItm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 03:49:42 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D88175848
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 00:48:54 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id c18so4984331ioc.6
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 00:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=482hD2qt/fBTqqMj7tAx9n2UG+YZouWq5uywKb+Ersw=;
        b=M19HlaEWFMO5kHQfzFlCLzmDcVSL7CIc0WlpcCMOt9UgrGMCX4Lr0eNBQ5L6PyXgl8
         IkHtVnjDicQhYvUbChvfUgrsu2QfAuhtnwGJLJc0TcXKu6eUe9oHglyI7PkxlnH6hUx3
         aaFpSrogRbKBIobHDn5OTu8YJBTcwN5YZjjffLSb3yysxbLD0xoO47DF1HBW60GfOMty
         AogDZ6dOstriarTzpKLv+3xBXF+8KhfiDOAgP+A5ocHrBQc1jjP+DfI1twjNWOb1oGWN
         w2nScQ7ohoKGjjStfKCpFaJrPruocyH/u3DMg+sTExXCEQehx9VCQ7PPhBsig0RT2jSL
         945A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=482hD2qt/fBTqqMj7tAx9n2UG+YZouWq5uywKb+Ersw=;
        b=lkeYmUHgzyaPFVE5OS0ObmgwEnWuiEyJVZlNWTQy+z05eTKGmrZaMeDSa+r96P+Tys
         arIJLqiu+cCSe8em+ll4uk3BqIU6lJh4ScFXXkoMsR1WlToAef6vSEjrwr7WSPkf0WHY
         hj5xsV4qnURv2HBQRLhCxNR4gaObUAvmFmss2eeeJef/yLEtT6w8WLw55wqGgT3FvTgk
         uQ9iOB9amgazN2SPNZ8gLUS0ITR2r0iw7oiTnmrz4zkKpQlP+buDtgTRxJB0BS1WHjmy
         9mcCKJ6qjNuqpbBNn1frW7ySfOysInMhT0DXlhhFnvUsXK1KqhV+ufBpxTjtIF0wXw7M
         Jn2A==
X-Gm-Message-State: AOAM533QyDePKYMVYsnKUBwIBPWFM/+/6GmL1klzHbvVgn7WLrWIp3nj
        QkG8Uivx+vwDwJVdVY8Mu2ddIw==
X-Google-Smtp-Source: ABdhPJyph0+r+OaL+USUMZ6pzp9tvhX9O/L6ChA22JMqK7rKFwLKaSCOe7ZVdIORk9Of7XkvPGd6sQ==
X-Received: by 2002:a5e:d60d:0:b0:640:9e90:c1c4 with SMTP id w13-20020a5ed60d000000b006409e90c1c4mr26083357iom.0.1646297333361;
        Thu, 03 Mar 2022 00:48:53 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id m9-20020a923f09000000b002c2a1a3a888sm1480704ila.50.2022.03.03.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:48:53 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v3 3/6] clk: qcom: gcc: Add emac GDSC support for SM8150
Date:   Thu,  3 Mar 2022 14:18:21 +0530
Message-Id: <20220303084824.284946-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the EMAC GDSC defines and driver structures for SM8150.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/clk/qcom/gcc-sm8150.c               | 10 ++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 85a431ac417b..08ba29e3a835 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3448,6 +3448,15 @@ static struct clk_branch gcc_video_xo_clk = {
 	},
 };
 
+static struct gdsc emac_gdsc = {
+	.gdscr = 0x6004,
+	.pd = {
+		.name = "emac_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
 static struct gdsc usb30_prim_gdsc = {
 	.gdscr = 0xf004,
 	.pd = {
@@ -3714,6 +3723,7 @@ static const struct qcom_reset_map gcc_sm8150_resets[] = {
 };
 
 static struct gdsc *gcc_sm8150_gdscs[] = {
+	[EMAC_GDSC] = &emac_gdsc,
 	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
 	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
 };
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
index 3e1a91876610..40596b9ded06 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
@@ -243,5 +243,6 @@
 /* GCC GDSCRs */
 #define USB30_PRIM_GDSC                     4
 #define USB30_SEC_GDSC						5
+#define EMAC_GDSC						6
 
 #endif
-- 
2.35.1

