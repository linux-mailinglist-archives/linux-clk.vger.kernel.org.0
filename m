Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E3D303E3E
	for <lists+linux-clk@lfdr.de>; Tue, 26 Jan 2021 14:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391931AbhAZNME (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 Jan 2021 08:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391909AbhAZMrw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:47:52 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19E1C0698CB
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:50 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id g10so16338538wrx.1
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tBcmISQSY7al+YXFrknNe1bUw1SwG09WB9C2kPAzCl4=;
        b=cyrjzWy83Rq8JRlGTOPUrMmxadvUnL9vvSIwiT3lS5yx2UIM7HYTjxC2kb6/frhSfw
         eL79RzsZqjIO7fQm26/px8IhbQJ7T+PJVEDBkJXNY/MZoyd6Mz0LHerlebTI9qf3jQ4+
         nm3cPAfc9dPOwRZwVpThmEGq8rECXtzO/NPlqtGgQfuoJpy4BXhMszQL9K5/wjYVDplW
         WfMVfWJJUIJ7uR2/o10H2ZM3P6Dr/NmWnTHX5OMwo8ySPtZ7Hkr7F1SQwNanh7MGEmBB
         BehkkQe5ulO3rIzCzKhjVCKxeNNFd8mv17kNzT8DjG8zSygdmP4csM/A7Jj8DMN/YNVr
         HPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tBcmISQSY7al+YXFrknNe1bUw1SwG09WB9C2kPAzCl4=;
        b=oaHN4FU1kiyNxFlwNpmAZ2rAxk1+QMBhzH76Ncu3Hh3r2WgOZ/5GcsB7rxij6ETqE2
         OgQeWvFroRIMeCMa/62DEb6+bdmMprEkFZ3iDmle7OvXY9YWK++y8PMfVXPdZxi/rTDG
         EwaOLxsUXcjZXafVYH8xAhpXKG8+DtRze6JCpJJz1mkbvJrC0tNxrFPGzCP2OskfDY2E
         4S+wuIuPJnsJLpiejDouE2FQMiiZ1lVpRRKHvzvNOsYouBT0H+CSJJb/Rn9V5/OHbj9H
         RncPW97aCqGVJNJXb5w6MXmeivvGg6pMTDX/BaY3kFDjcvrhIE3O7wp8Qf922GVQUc7t
         pSJg==
X-Gm-Message-State: AOAM533qKxrV1gxs6rOEGN4Yn6MuiXp78/xnkg4H8JYHsejT7N3tZ6tE
        VsdQpb0nm3HOzkujhNoZ+Jye+Q==
X-Google-Smtp-Source: ABdhPJxF21KMVb8+euVFIN2MtWkgjYTAzbXApT5h5t62yJx2bd7huKJoccmycG7F/+QFypE8Db85CQ==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr3962490wro.311.1611665149702;
        Tue, 26 Jan 2021 04:45:49 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:49 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 04/21] clk: qcom: clk-regmap: Provide missing description for 'devm_clk_register_regmap()'s dev param
Date:   Tue, 26 Jan 2021 12:45:23 +0000
Message-Id: <20210126124540.3320214-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/qcom/clk-regmap.c:97: warning: Function parameter or member 'dev' not described in 'devm_clk_register_regmap'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/qcom/clk-regmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-regmap.c b/drivers/clk/qcom/clk-regmap.c
index ce80db27ccf2a..92ac4e0d7dbe2 100644
--- a/drivers/clk/qcom/clk-regmap.c
+++ b/drivers/clk/qcom/clk-regmap.c
@@ -87,6 +87,7 @@ EXPORT_SYMBOL_GPL(clk_disable_regmap);
 /**
  * devm_clk_register_regmap - register a clk_regmap clock
  *
+ * @dev: reference to the caller's device
  * @rclk: clk to operate on
  *
  * Clocks that use regmap for their register I/O should register their
-- 
2.25.1

