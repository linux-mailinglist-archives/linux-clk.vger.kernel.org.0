Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313F23C1E66
	for <lists+linux-clk@lfdr.de>; Fri,  9 Jul 2021 06:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbhGIEee (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Jul 2021 00:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbhGIEe2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 00:34:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FD5C0613DC
        for <linux-clk@vger.kernel.org>; Thu,  8 Jul 2021 21:31:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c28so20135387lfp.11
        for <linux-clk@vger.kernel.org>; Thu, 08 Jul 2021 21:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=evja71V+pcmqd6EmSv+Kg5ZvqKs56bvDZjR9SCjtxVgotJ6idANj1ATscxqed8yhrH
         BqZTpJzJV8b2/mRGTTUw/C87V0Ub/9ljyKAib/5HmOck6HhDX9xbtcYfIDoh6B/YRcFO
         FvHhKQEyAUsy4q66QaZtOlUhXFfULRgLI0Yh1LDLF19WJqfLFoD0DGuokdd5v0YC1Yw6
         nACS2JKBe1KaPMWI2WkDogCGf5h7LS/kMaTVUidb/nitQziDHKrtzOHhImfuus0axEJE
         ViuhFR3ovCswl+VA/6QiXst+hy99HD96ktL4Qv7YVQa/qw+Dof8NNthKI1nTf9NqFV3+
         XJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=kmELbFbqn7USJHp4JRU4biIa/IEsu9cnrB2lfunr70emaUiAvpQJ70Xzss6rCBLnwy
         2H/PXSOaUNTq5CKm/kq/QkfWECPyj4xoCC5lemCNZuFCbwgScUcGvoP6qb6KJErV3cDa
         VcUDATLdX8nRkF0tFfBgsor5MTfKTdU49RZARD0fAQVB+aUW5BbJcnxpWBpr7DP4k88w
         ARqINYXHmFnBbMYEZRdp5OFc2yXsw+5DtlzoT4ecLUB4jvRhpWQsQaAprfWncyogOU/X
         OteJ4+Hx6reWH5cpdtkR6P+RLp8wwawQ6hrFzZ/pPaXOeno3zO4sqWLEhTppp4XPFw5t
         YK8A==
X-Gm-Message-State: AOAM532n2RuWP1rI8U7mj5wvL6OwEEAvs8E18we3nWPdM3b9MSrzoq+L
        1biBwATB8uCJssEoXW6LYhEeBdtwbEFpgQ==
X-Google-Smtp-Source: ABdhPJwZptgyRZPC0nRqYzgnhWBWhgKSY6kj6YkrVEHm0vPEIBEUMmZjkoNbraIyVlKA+ynzcecnJg==
X-Received: by 2002:a19:408c:: with SMTP id n134mr26254126lfa.329.1625805103973;
        Thu, 08 Jul 2021 21:31:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 6/7] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 07:31:35 +0300
Message-Id: <20210709043136.533205-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdsc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index de09cd5c209f..dfbfe64b12f6 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -955,7 +955,6 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.30.2

