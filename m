Return-Path: <linux-clk+bounces-1724-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D3C819025
	for <lists+linux-clk@lfdr.de>; Tue, 19 Dec 2023 19:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DAB7284A32
	for <lists+linux-clk@lfdr.de>; Tue, 19 Dec 2023 18:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208923FB21;
	Tue, 19 Dec 2023 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i5hwe3Fl"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D0739879
	for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-553338313a0so3632141a12.2
        for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 10:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703012139; x=1703616939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sx/GnrdS4dyv/oxcSjAAXc9AeJJcpwJg6SELK7zCR5E=;
        b=i5hwe3Flkguy1U07C+lPdsG24w3T2lWmLQ3OhEbXkrBgy3IdcfnfQsLFOmugszaNk1
         fG6CAVMr7j13pxoJxQzgTzYrrP/+uy9/3KZt+iUPfY9QqDYNggYGbXRoTQ4gWZZYw2ie
         cuoVl8zNH+GuFyqb1OxCoReeWFr8BElXhNYCUasgabNnHuB0ymDzGgF0Ig/cgU1R2Vhy
         79RvmLvaTheNhgtzbs/55A6YPR93bD0qLvXWCMxrr1XF+i665GKeGNVaoS9z50ZsNLJc
         B0gmSPa3+YeJ0Q+rUC2Pr2YMh/C3RiJ900BoK5gtCAB9NLDJkoDXZX02ulCVB0YpeSRl
         LqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703012139; x=1703616939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sx/GnrdS4dyv/oxcSjAAXc9AeJJcpwJg6SELK7zCR5E=;
        b=P0ccQRg4gp8o4q/7vf90XUldX9PbZNnhVI+cRqH4tqVzo//rtpl1DoZSiEn9gt76L9
         7KJFfPr2KvYOYdpTF6W416O8yq+4XEg2iiUuRgHBPsS/Av/gz+Ac8/YzEZ0Y5JTOtBw7
         2jd2oImTqgDny0Qr1J9Po2J43Zz/5DzusMmG19QPAUVYs/zgNjHuHfypT1MuEXf3v4AA
         aoz2MU7TaCc+yA5qmEkVA6v78OYp4rArnu86+UXtGZkNEcgViKh/Ms2sBZG604ozgCwj
         KM8GzsC8pm0JCn6679P3005OSOsenu/pWDZb7nw4oTELgVed7BEYxVTs8swvvEvqfw6+
         C1Vw==
X-Gm-Message-State: AOJu0YwZ3QbKh0lEQxwF6EFguYN3WSecjf4kRHu57nyHgrn9stzB6aO0
	o+FXJqlL2dOTS0xg5rhmW4EgDQ==
X-Google-Smtp-Source: AGHT+IGvBKwl5CArxKIygFyA0dmoXWOBQYn2WjmPLmwiuwUeqxqzA1CsCbgkn3250M0WQB92aFplmg==
X-Received: by 2002:a17:907:7416:b0:a23:397c:faef with SMTP id gj22-20020a170907741600b00a23397cfaefmr1819685ejc.121.1703012139666;
        Tue, 19 Dec 2023 10:55:39 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906250b00b00a233a4c4a30sm3782036ejb.90.2023.12.19.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 10:55:39 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Dec 2023 19:55:33 +0100
Subject: [PATCH 2/2] clk: qcom: dispcc-sm8650: Add test_ctl parameters to
 PLL config
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-topic-8650_clks-v1-2-5672bfa0eb05@linaro.org>
References: <20231219-topic-8650_clks-v1-0-5672bfa0eb05@linaro.org>
In-Reply-To: <20231219-topic-8650_clks-v1-0-5672bfa0eb05@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703012135; l=1273;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=d7fTpCN4ELYmAt8UhLatNQ/qPqyouKJJXysPr29VFl0=;
 b=8O8AGQiz0WxOOgxa7fj9mAdAH4cucKoA9J7GY+kydWFn/ORlgixUqp4DgkgF45Zches7/P2WI
 JI9Qn0MW3G0BflhUAbFNCKIr37Rkbvohz2aZCx1gzn8bwT2Ngv7Ri/a
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

These values were missing. Add them.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index 6283099faf57..f3b1d9d16bae 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -79,6 +79,10 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
 	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
 	.user_ctl_val = 0x00000000,
 	.user_ctl_hi_val = 0x00000005,
 };
@@ -106,6 +110,10 @@ static const struct alpha_pll_config disp_cc_pll1_config = {
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
 	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
 	.user_ctl_val = 0x00000000,
 	.user_ctl_hi_val = 0x00000005,
 };

-- 
2.43.0


