Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26F56BB488
	for <lists+linux-clk@lfdr.de>; Wed, 15 Mar 2023 14:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbjCONX7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Mar 2023 09:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbjCONXp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 09:23:45 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B76A3B7C
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 06:23:43 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id eh3so19570661edb.11
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678886622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnW0CMrrRD3o9YvTtj/2PZfd1w3APSitkBSkSzkAq3A=;
        b=cIoenhYmTDDKZ0euB2ODKr3LotX4ppL2RTmY7rx4LHYybPdccQrPSTr+zjPffclIwD
         k+6Q4fDW3EAwNRRuFsbyhhImD8R3omHYItX05zQqnwsqlABoIOICjL/Cf/X9pC4J8Wjv
         HZj1lO/Nsh2knHgaHr7f2V67UlTJVZWVAoynksoC9l8EeKEowzrk0pY+o+vQHm3IeQnm
         PvdZtWTxW3F3JCNkpG+rgvq0x8m1XaGQ7HaEivuI/+dOvcEeU3nYVP0i9mtPnqsRSVM6
         X1N4cWtUjSaXy2FJCd1/duAtLA7rV8DmP43e1rCd0jFSF52WSdUK/eikCZgXZ0TRFum3
         eCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnW0CMrrRD3o9YvTtj/2PZfd1w3APSitkBSkSzkAq3A=;
        b=1/uGjC/2708je2XKDSA7TLYgOKy03rKrwcBIp1/8B6gKdIY6SnCZoUz348xd/KjeYU
         nKYLSVLqh7Lm1i4PHH2Q2eokv73db7iXyCtSVRV7+fsDWz9QkRX+GREtlOJZOgq5fgDr
         jMHZriCGGif94DHHoaYXV1moESADVkwCMJMijDf0mg8Y4LTM6gO0B6Mkya54Y5dZRg28
         oTvhVPOwBBgR/ci1x2I3Fr9UblJNhwOtXa6nC7YsuwQmHP2gZvVgx1f4JJs+6gDJ3dH+
         OkOCLxSD56T6vpm8A2mQgRMXigHrn7sojZ9jNhVJ0s6xU5YsV6OA2p40nNJ53UL8rAvS
         Vf6A==
X-Gm-Message-State: AO0yUKWcz4edpPrkenpzT8t9jDK6LM6iWPXyOC+JEn7V/XPdsjpI/bKz
        a6gBJ++pFTdzFYriN4dxWU6gaw==
X-Google-Smtp-Source: AK7set+W+V2K+JVgObXv7PEO2bdA92Y2AmBplxjf8AwC8skNcxMQIt1ZNpm4fZzwq+uDEYAYCDcLJQ==
X-Received: by 2002:a17:906:dff5:b0:8b1:3193:4874 with SMTP id lc21-20020a170906dff500b008b131934874mr5703584ejc.46.1678886622632;
        Wed, 15 Mar 2023 06:23:42 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id pj18-20020a170906d79200b008b133f9b33dsm2497365ejb.169.2023.03.15.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:23:42 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [RFC PATCH 5/5] clk: qcom: Add sync state callback to all SM8450 providers
Date:   Wed, 15 Mar 2023 15:23:30 +0200
Message-Id: <20230315132330.450877-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315132330.450877-1-abel.vesa@linaro.org>
References: <20230315132330.450877-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that we have support for sync state delayed disabling of unused
power domains and a provided generic gdsc sync state callback, add it to
all the providers related to the SM8450 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/camcc-sm8450.c  | 1 +
 drivers/clk/qcom/dispcc-sm8450.c | 1 +
 drivers/clk/qcom/gcc-sm8450.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 51338a2884d2..6ae360898aee 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2847,6 +2847,7 @@ static struct platform_driver cam_cc_sm8450_driver = {
 	.driver = {
 		.name = "camcc-sm8450",
 		.of_match_table = cam_cc_sm8450_match_table,
+		.sync_state = gdsc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index adbfd30bfc96..45f4ea3d26bc 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1803,6 +1803,7 @@ static struct platform_driver disp_cc_sm8450_driver = {
 	.driver = {
 		.name = "disp_cc-sm8450",
 		.of_match_table = disp_cc_sm8450_match_table,
+		.sync_state = gdsc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 84764cc3db4f..f2b542753553 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3262,6 +3262,7 @@ static struct platform_driver gcc_sm8450_driver = {
 	.driver = {
 		.name = "gcc-sm8450",
 		.of_match_table = gcc_sm8450_match_table,
+		.sync_state = gdsc_sync_state,
 	},
 };
 
-- 
2.34.1

