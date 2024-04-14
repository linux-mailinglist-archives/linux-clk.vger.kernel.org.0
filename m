Return-Path: <linux-clk+bounces-5628-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E133D89BE56
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 13:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10FC71C21395
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 11:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6776BFC7;
	Mon,  8 Apr 2024 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aC3TH4m9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81916A332
	for <linux-clk@vger.kernel.org>; Mon,  8 Apr 2024 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712576837; cv=none; b=E+8w21RLGFRRwD1DoqVHyrY2WMUSqWnjML4rhHKcrPBjlkj7bithkHbmnNDQhnV53QYN022eBDGhJJxNeO/r0qwtahm6s/pze8zT5a2uA9Wxe6X2CQo6Q9EzODt1o9qXaIBpdvTQ62QrG0PjfZmb8NtwUw96oGJs/CQxyUK/es4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712576837; c=relaxed/simple;
	bh=IKtUHbqglcvzb700IveFFW+Q8Qyh3/7h1q+qa+Dlnpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rww0F+inGiUlxVEfTFdUuc4UPyTd2MRfRyZHxOO0OVe7C0ibRrqdeduXOm0oN9pkufDeX/DbqmmzWGjqIkx+CXya3Ml84hG2kcN8pzzBqjA+tvkFzN17ReBpwvb+n6kUm8h7xlQp0/+xyUIGPPRE5a/A1NxIFjw/QaP5shb/toc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aC3TH4m9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d47ce662so4775250e87.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2024 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712576834; x=1713181634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CN1hLTpzqQmwOO4CNeIWzvBcYoI/2klJca3uhjxthOE=;
        b=aC3TH4m98bL6luMYSOJPqsvbLz7bOYvQ9G/9lI+dPbkt8BUy/9daGrQzFfCpW25Xy8
         x94G8KDbcfzxxbm0U3PRuW1/MUGqbI67Fy3lCyQtiGN8Q6UHWfCGOeEMc0m036r+gPYa
         RVH5qiB0xU+qX2iDX0PCRLWosIQ+4X3f525yNjsQuEtFk0KdEjyZHouT4FgJXlI3vPf6
         rlZ4NrVGHt6D0sIZPVkhlDIYxtpGhZcnHHBlWPknOzvYFrF6rDq2CfDZCbcNz7COdvby
         TBXv6cffOVlc7oLXN01nBpI/yikJQ6wTfSYnczq9x8+2DUcQTJwue+EDiD73JGS11tfZ
         PX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712576834; x=1713181634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN1hLTpzqQmwOO4CNeIWzvBcYoI/2klJca3uhjxthOE=;
        b=i7Tgd/gJOA0KgT5nOHM01TJTlzpwWhi9zZqYWk5u9PrzbM6OehuWYY5eJbG1gqbvid
         531hMmHZ5L2m3FmO1rUUl/eSH1omN2GbGT+bAwNd0CnTnGUvrZJ7NhiwioLILJdqSdLz
         Lh1N8oPuqZ/t+guYcPxVl3oISQ0rG9kPFuYALr80YyP0UXnq1zdZeDyFqiwPYMmhag5e
         01oRDiEl86Yn3y7rxEKqNnd7B2EGs5Xa9/WaaXrIVcl1aUBXLDJXgZAEMJxtBGvogVPN
         o2Hj6Yl1r8D+04iWOxj82+DxBU9GvtJ+kIv+4uvyyU+bzvPkkTsAV8n+Je7NzJ70dk8I
         Dowg==
X-Forwarded-Encrypted: i=1; AJvYcCVOU0775Ur7NF/WaJNdbT6GbR+WdutKbwi/exUY1N8cCdqA+5TLnjclCuqr5HFK8e5AnvbY2ahQdBRt7xAn2UURsLT5Rnu5H2ZS
X-Gm-Message-State: AOJu0YzMF/vPSlk7LxtbzQ7esRjfZxaijfosPyxxGd/hlOGdi3c1lUAI
	f/MSrZZGmWyFC/8SDI/V6xjnInjOvHo42V+0ZA0uO3TA3nlmwum3KczZVNOFulM=
X-Google-Smtp-Source: AGHT+IGCm9bgFbhczRAIueF/v2N27cqAlm/rh8j3x6HKsHAKQr4mlMzDwMWZGS3pMDxQ7sfFiN4qAA==
X-Received: by 2002:a19:700c:0:b0:516:cbca:5c9a with SMTP id h12-20020a19700c000000b00516cbca5c9amr7461316lfc.9.1712576833913;
        Mon, 08 Apr 2024 04:47:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g17-20020a19e051000000b005158ddab172sm1175549lfj.19.2024.04.08.04.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:47:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 14:47:07 +0300
Subject: [PATCH 4/4] clk: qcom: dispcc-sm8650: fix DisplayPort clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-dispcc-dp-clocks-v1-4-f9e44902c28d@linaro.org>
References: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
In-Reply-To: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3086;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IKtUHbqglcvzb700IveFFW+Q8Qyh3/7h1q+qa+Dlnpg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE9k+tfTJFbid+O44LrGG5OcDG+49XUQpLvoEc
 OH1gSW1GiWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhPZPgAKCRCLPIo+Aiko
 1cKqCACei1rb7cgkzuppGz5EJiZ/ALBWOZza6WybcZXJtvDt6MuYNZuWKLlKByjkASGOqR8InSM
 fUeY7rLiIhJObbk8e6UwjRBLqoVJp/+S6X5jLaud5zLizXfSUK/BSQd/hmdnLFbIUAuaw+xsQ8w
 aPNYskOxSp3HyuB6qmyfC9rNatdicPvOfc5d/lYJ7Z4woa8hSKHBIUCNwjQucB1tCPOJ0xF5Kn1
 wZUmoElq7CwAi926gNqoPcithV+U1EjdvpOaxsd0BZlyr4xhUQKKg64c7tnk22MCDFpz9EQzuV5
 thpvqUS22cf3ZFNME5JbnZXHYZ9IaMMsS8P+Y4W2JWnGVOTc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SM8650 DisplayPort link clocks use frequency tables inherited from
the vendor kernel, it is not applicable in the upstream kernel. Drop
frequency tables and use clk_byte2_ops for those clocks.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index 9539db0d9114..3eb64bcad487 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -343,26 +343,17 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_disp_cc_mdss_dptx0_link_clk_src[] = {
-	F(162000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(270000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(540000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(810000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
 	.cmd_rcgr = 0x8170,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_7,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_link_clk_src",
 		.parent_data = disp_cc_parent_data_7,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -416,13 +407,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx1_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -476,13 +466,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx2_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -536,13 +525,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx3_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 

-- 
2.39.2


