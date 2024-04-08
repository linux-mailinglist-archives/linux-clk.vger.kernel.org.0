Return-Path: <linux-clk+bounces-5627-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A63F789BE55
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 13:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7571F22CB1
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 11:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CD16A8D8;
	Mon,  8 Apr 2024 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MmnZ18Fw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7C769E0C
	for <linux-clk@vger.kernel.org>; Mon,  8 Apr 2024 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712576837; cv=none; b=WOEf04SRyEyeKJY6/EG3m9l5BaI2lY06KfFdmjHhGfm7AEjM6JTCztk7sqOfRcc6Nk6cgtFBBIfkOFQSGlXIFHjzSAWDiREcTydK6VYuj3az7O8+80r3Rhhi04vSr4xtKzQ7ZNFrfXFdrhjDdpmTSzOZThP1I2gqAS2LW0AU+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712576837; c=relaxed/simple;
	bh=OsDfVmwigHiKLQONHsnbey3y8n9mOJj5tZKTmOviAn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pD/nX/Mc4IHTKQEjqbiwOo/Y8OOMCGXIE0UDNIpulJfztF4YFDvOtwo316rwuaLwS7mzCnREM7Tip6Dvec2bRYJDDz1CSIBkCU0UBVTNJvZSJE4DGqv9VI7z7Wua8uqcIsjub4519cwt76olfx1kGWXxz1XhG7jXpWuLHv1jA5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MmnZ18Fw; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d16db927so4339381e87.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2024 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712576832; x=1713181632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iTV4QYo3hma+PsA0jLP4qJZguBY70D1nyyF3au1lSI=;
        b=MmnZ18FwnEyEwiZFdyEqmoj1UrC6Cf/Yy3qDxmrS5OkpBbr4lRfx9AxvCRbkc478Yv
         vDyRUYereZuJxVsJABD9U0N43juvNKA9OihYUHGGj+zyC8HLXsMgCgYnb96mdjirdyBo
         dTIRz22L7jL7S4sZHAQE5ywZYKZT2qj3C/k/zWddzXszO6J6eMeQfIxMrv5rT1nKrT+H
         ag8P4/GivpRDXkDmX7iGf1m/3m3qCE2CKFPwAbwDzBxLc1sPdt/4Bc6ctMZcA5QbLcX7
         ZAz9rjD2UtHK2XOj/7tWdxj0bRV0Sxbfd0CkGFlSinFYCO5pgtTLG1xBMpWmcQXsvVVM
         hQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712576832; x=1713181632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iTV4QYo3hma+PsA0jLP4qJZguBY70D1nyyF3au1lSI=;
        b=MtZEdSxQYsxSPtsnOB7LR1IMU+6LIqq5SRke5623DOlfo8sce5W9rJbPj3iu40FZ1W
         5PFtO4hmcHfwXJIXfggtYvl3m7LQIRT+VwPt0iiRi3cLW8VoVdDee15E9siJ+Phk1y6j
         Z8p428f9H/bBXmHXjIMz/pq6PVJjsIDdiX7H/MyT4pAn/Tr98QQBPrCC7K9Z4uXQRF9F
         FZvRfApCILYv7xlUyj01nrrW4FNU/oy8jR6FRXQ9yZeisai4TVPTCT8IM1TAwmDKfNJp
         h8XCiX8ykR77pOaLvkDIp9fWTmSHihNMlDlNY7uuNLP7DVoz7e5g0+gge7QJsK+BQo19
         L+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV20YPkEYmwzc1oDMPkCuCX2hZ6hL1K9KQ2g3N7/ulXuTLKESwZnR+ktLnU825n3Ssvhq8oDhRz+g7hwJMPzVjg3kZJrtrWVyF9
X-Gm-Message-State: AOJu0Yzw9o7tVEp09spMWZk7OL8onLXen9jhmrTquZ8+gL3bUh3QewFx
	+fnrUPjYNDLVy0X6CSEXVGE8tqCSwc0bFIhnGI8msw7lPXnmLWRE/DGhvSSga4R7mR+mtDWh2fp
	c
X-Google-Smtp-Source: AGHT+IHqPwzhcmiM/FFm6l5Gaq1CDWR1urthcYvPs25MRFKeLPNrQy0Zb66y8K1jwvGHKkPMjZAXPw==
X-Received: by 2002:a19:8c58:0:b0:515:9783:938d with SMTP id i24-20020a198c58000000b005159783938dmr5304212lfj.63.1712576832419;
        Mon, 08 Apr 2024 04:47:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g17-20020a19e051000000b005158ddab172sm1175549lfj.19.2024.04.08.04.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:47:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 14:47:05 +0300
Subject: [PATCH 2/4] clk: qcom: dispcc-sm6350: fix DisplayPort clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-dispcc-dp-clocks-v1-2-f9e44902c28d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OsDfVmwigHiKLQONHsnbey3y8n9mOJj5tZKTmOviAn4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE9k9H5X8yWLigKleQcptLAkRmAVjhc0DUmetS
 t6V2YwGWdWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhPZPQAKCRCLPIo+Aiko
 1VinCACL15UdGiAHHUzISh3SClQ/NVhj0nL6bIOISNQbcB/Y3jfnqOkEIdiL6uXtknAihDBevZq
 /N2gZ2INDcXqZDpYaMTwz7PB+w8qulCbwGuKHG9rrXlJSaqtvKBNv/wi2OYkRRA+KyXhGGewOA7
 uWxcy/gtGLWqpucxCGaJJu3cEOCe0XiPMDXhOaJd6OXZW00rSu/rX1ioc6NPSAdz2ow+Wz83tQ5
 txyqMynPFC1xcUv/1no3jrkkkHurBxz3SN8a3ZMfjBznYpMG317IlPTkSW9bsG7XqRj5aRZP3re
 8oxcL6744FUt2kPjn1RFC0LTu7n/HlR/w6aIavhSjS+q2mrg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SM6350 DisplayPort link clocks use frequency tables inherited from
the vendor kernel, it is not applicable in the upstream kernel. Drop
frequency tables and use clk_byte2_ops for those clocks.

Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm6350.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index 839435362010..e4b7464c4d0e 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -221,26 +221,17 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_disp_cc_mdss_dp_link_clk_src[] = {
-	F(162000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(270000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(540000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(810000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.cmd_rcgr = 0x10f8,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_dp_link_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 

-- 
2.39.2


